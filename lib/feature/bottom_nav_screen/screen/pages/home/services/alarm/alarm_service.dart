import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class AlarmService {
  static const MethodChannel _channel = MethodChannel('order_alarm');


  /// Requests notification permission for both Android (API 33+)
  /// and iOS. Returns true if permission is granted, otherwise false.
  static Future<bool> requestNotificationPermission() async {
    // Check if notification permission is already granted.
    if (await Permission.notification.isGranted) {
      print("Notification permission already granted");
      return true;
    }

    // Request notification permission.
    final status = await Permission.notification.request();
    if (status.isGranted) {
      print("Notification permission granted");
      return true;
    } else if (status.isPermanentlyDenied) {
      // Optionally, guide the user to app settings if permission is permanently denied.
      print("Notification permission permanently denied. Please enable it in settings.");
      await openAppSettings();
      return false;
    } else {
      print("Notification permission denied");
      return false;
    }
  }


  /// Tells the native side to start the alarm notification.
  static Future<void> startAlarmNotification(int notificationId) async {
    try {
      await _channel.invokeMethod('playAlarm', {
        "channelId": "$notificationId", // or any string if you have multiple channels
        "notificationId": notificationId
      });
    } on PlatformException catch (e) {
      print("Failed to start alarm notification: ${e.message}");
    }
  }


  /// Tells the native side to stop the alarm notification.
  static Future<void> stopAlarmNotification() async {
    try {
      await _channel.invokeMethod('stopAlarm');
    } on PlatformException catch (e) {
      print("Failed to stop alarm notification: ${e.message}");
    }
  }

  static void setupMethodChannelHandler() {
    _channel.setMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case 'acknowledged':

          final args = call.arguments as Map;
          final String notificationId = args['notificationId'];
          print("Received notification id: $notificationId");
          print("Alarm acknowledged from native side.");
          // Here, you can notify your UI or trigger any other action.
          break;
        default:
          print("Unknown method ${call.method}");
      }
    });
  }
}
