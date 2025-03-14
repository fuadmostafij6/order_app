

import 'package:flutter/material.dart';

class ResponsiveLayout {
  ResponsiveLayout._();
  static double _screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static bool isMobile(BuildContext context) {
    return _screenWidth(context) < 600;
  }

  static bool isTablet(BuildContext context) {
    return _screenWidth(context) >= 600 ;
  }

}