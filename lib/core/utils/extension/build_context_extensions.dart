

import 'package:flutter/material.dart';
import 'package:create_order_app/core/core.dart';


extension ContextExtensions on BuildContext {
  // Get screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  // Get screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  // Get aspect ratio (width / height)
  double get screenRatio => MediaQuery.of(this).size.aspectRatio;

  // Get vertical spacing as a fraction of screen height
  double heightFraction(double fraction) => screenHeight * fraction;

  // Get horizontal spacing as a fraction of screen width
  double widthFraction(double fraction) => screenWidth * fraction;

  // Get padding
  EdgeInsets get screenPadding => MediaQuery.of(this).padding;

  // Get view insets bottom (keyboard or system insets)
  double get viewInsetsBottom => MediaQuery.of(this).viewInsets.bottom;

  // Get orientation
  Orientation get orientation => MediaQuery.of(this).orientation;

  // Check if the device is in portrait mode
  bool get isPortrait => orientation == Orientation.portrait;

  // Check if the device is in landscape mode
  bool get isLandscape => orientation == Orientation.landscape;

  // Get safe area height (excluding top and bottom padding)
  double get safeAreaHeight => screenHeight - screenPadding.top - screenPadding.bottom;

  // Get safe area width (excluding left and right padding if needed)
  double get safeAreaWidth => screenWidth;
  TextScaler get textScaleFactor  =>   MediaQuery.of(this).textScaler;
  AppLocalizations get localization => AppLocalizations.of(this)!;
}