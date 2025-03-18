
import 'package:create_order_app/core/core.dart';
import 'package:provider/provider.dart';
import 'package:create_order_app/feature/feature.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {

     WidgetsBinding.instance.addPostFrameCallback((_) async {
      final result = await AlarmService.requestNotificationPermission();
     await Provider.of<OrderProvider>(context, listen: false).fetchOrders();
      if(result) {
        print("true");
       // await  load();
      }
      else{
        print("true");
      }
     });


    super.initState();
  }

  bool _enabled = true;
  int _status = 0;
  List<DateTime> _events = [];

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlatformState() async {
  //   // Configure BackgroundFetch.
  //    await BackgroundFetch.scheduleTask(TaskConfig(taskId: 'com.foo.my.task', delay: 600,
  //       // minimumFetchInterval: 2,
  //       stopOnTerminate: false,
  //       enableHeadless: false,
  //       periodic: true,
  //       type: TaskType.DEFAULT,
  //
  //       requiresBatteryNotLow: false,
  //       requiresCharging: false,
  //       requiresStorageNotLow: false,
  //       requiresDeviceIdle: false,
  //       forceAlarmManager: true,
  //       //
  //       requiredNetworkType: NetworkType.NONE
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<OrderProvider>(
        builder: (context, order,_) {
          return AppButton.filledButton(load: false, text: "Generate Order", onPressed: () async {
         // await load();

            order.addRandomOrder();
          });
        }
      ),

    );
  }
}
