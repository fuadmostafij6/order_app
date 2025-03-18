import 'dart:async';
import 'dart:io';


import 'package:create_order_app/feature/bottom_nav_screen/screen/pages/home/services/alarm/alarm_service.dart';
import 'package:create_order_app/feature/bottom_nav_screen/screen/pages/home/services/order/order_services.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:create_order_app/core/core.dart';
// import 'package:workmanager/workmanager.dart';
//
// import '../../feature/bottom_nav_screen/screen/pages/home/provider/provider.dart';

// @pragma('vm:entry-point')
// void callbackDispatcher() {
//   // Initialize Flutter bindings for the background isolate
//
//
//   Workmanager().executeTask((task, inputData) async {
//     print("Native called background task: $task");
//     WidgetsFlutterBinding.ensureInitialized();
//     // Create the MethodChannel
//     // const MethodChannel platform = MethodChannel('order_alarm');
//
//     try {
//       await Initializer._initServices();
//
//       final isarService = IsarService();
//       // If your IsarService needs explicit initialization, do it here.
//
//       final orderService = OrderService(isarService);
//       await orderService.addRandomOrder();
//       // Invoke the native method
//
//       // await platform.  invokeMethod('playAlarm', {
//       //   "channelId": "${inputData?['channelId']}", // or any string if you have multiple channels
//       //   "notificationId": inputData?['channelId']
//       // });
//     } catch (e) {
//       print("Failed to invoke native method: $e");
//     }
//
//     return Future.value(true);
//   });
// }
abstract class Initializer {
  Initializer._();

  static void init(VoidCallback runApp) {
    ErrorWidget.builder = (errorDetails) {
      return CustomErrorWidget(
        message: errorDetails.exceptionAsString(),
      );
    };

    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        print( details.stack.toString());
      };

      await _initServices();

      // Workmanager().initialize(
      //     callbackDispatcher, // The top level function, aka callbackDispatcher
      //     isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      // );
      //
      // String uniqueName = DateTime.now().microsecond.toString();
      // //  Provider.of<OrderProvider>(context, listen: false).addRandomOrder();
      // await Workmanager().registerPeriodicTask(uniqueName, "Auto add order",
      //     inputData: {
      //       "channelId":110
      //     },
      //
      //     frequency: Duration(minutes: 15),);


      runApp();

   //   BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
    }, (error, stack) {
      print(error.toString());
      print(stack);

    });
  }

  static Future<void> _initServices() async {
    try {
     await   Future.delayed(Duration(microseconds: 200));



      _initScreenPreference();

      _initHttp();


     await _loadEnv();
      await _dependencyInjection();
     await _initPermission();


      //
      // await _saveIp();
      //
      // await _saveDeviceName();

    } catch (err, s) {
      print(s);
      rethrow;
    }
  }

  static Future<void> _initPermission() async {
    AlarmService.setupMethodChannelHandler();
  }

  static void _initHttp (){
    HttpOverrides.global = MyHttpOverrides();
  }

  static Future<void> _dependencyInjection () async{
    setupLocator();
  }

  static Future<void> _loadEnv () async{
    await dotenv.load(fileName: ".env");
  }




  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}