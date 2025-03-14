






import 'package:flutter/material.dart';
import 'package:create_order_app/core/core.dart';

 class AppTexts{
   AppTexts._();
  static Widget text ({int? maxLine, TextAlign? textAlign, TextOverflow? overflow,required String text,
    FontStyle?fontStyle,
    Color? color, double? fontSize,TextDecoration? textDecoration,
    TextScaler? textScaler,
    FontWeight? fontWeight,
    double? height,
    double? letterSpacing, String? fontFamily}){
    return Text(text, maxLines: maxLine, textAlign: textAlign,

      textScaler : textScaler,
      overflow: overflow ?? TextOverflow.ellipsis, style: TextStyle(color: color ?? AppColors.gray900,
          fontStyle:fontStyle ,
          height: height,
          decoration: textDecoration, fontSize: fontSize ?? Dimensions.titleLargeSize, fontWeight: fontWeight,letterSpacing: letterSpacing, fontFamily:fontFamily  ),);
  }
}