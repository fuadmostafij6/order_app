import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  AppPermissions._();
  static Future<PermissionStatus> storagePermission ()async{
    late PermissionStatus permissionStatus;

    if(Platform.isIOS){
      permissionStatus = await Permission.storage.request();

    } else {
      final androidInfo = await DeviceInfoPlugin().androidInfo;

      permissionStatus = switch (androidInfo.version.sdkInt){
        > 32 => await Permission.photos.request(),
        _ => await Permission.storage.request(),
      };
    }

    return permissionStatus;
  }
}