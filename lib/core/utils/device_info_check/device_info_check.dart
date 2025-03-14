import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import 'package:create_order_app/packages/dart_ipfy/dart_ipfy.dart';

class DeviceInfoChecker {
  DeviceInfoChecker._();

  static Future<AndroidDeviceInfo> getAndroidInfo() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      return await deviceInfo.androidInfo;
    }
    throw UnsupportedError("Platform is not Android");
  }

  static Future<IosDeviceInfo> getIosInfo() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      return await deviceInfo.iosInfo;
    }
    throw UnsupportedError("Platform is not Android");
  }


  static Future<String?> getDeviceName() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return '${androidInfo.manufacturer} ${androidInfo.model}';
    } else if (Platform.isIOS){
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo infoInfo = await deviceInfo.iosInfo;
      return infoInfo.model;
    }
    throw UnsupportedError("Platform is not Android or IOS");
  }

  static Future<String?> getDeviceIp() async {
    final ipv4 = await Ipify.ipv4();
    return ipv4;
  }
}
