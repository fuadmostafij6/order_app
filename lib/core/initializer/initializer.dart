import 'dart:async';
import 'dart:io';

import 'package:create_order_app/feature/bottom_nav_screen/screen/pages/home/services/alarm/alarm_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:create_order_app/core/core.dart';


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


      runApp();
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
    await AlarmService.requestNotificationPermission();
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