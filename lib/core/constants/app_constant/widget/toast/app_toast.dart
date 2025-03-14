

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:create_order_app/core/core.dart';

class Toasts {
  Toasts._();
  static success({required String msg, required BuildContext context}) {
    return BotToast.showText(text: msg, duration: const Duration(milliseconds: 2500), contentColor:AppColors.black, textStyle: TextStyle(color: Colors.white, fontSize:16.sp,), align: const Alignment(0, 0.7));
  }


  static error({required String msg, required BuildContext context}) {
    return BotToast.showText(text: msg, duration: const Duration(milliseconds: 2500), contentColor:AppColors.brand700 , textStyle: TextStyle(color: Colors.white, fontSize: 16.sp,), align: const Alignment(0, 0.7));
  }
}