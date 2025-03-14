
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:create_order_app/core/core.dart';

// Import the Dimensions class

class ThemeConfig {
  // Light theme settings with Material 3
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true, // Enable Material 3
    fontFamily: GoogleFonts.inter().fontFamily,

    // Define color scheme and text theme
    textTheme: TextTheme(
      // Display styles
      displayLarge: TextStyle(
          fontSize: Dimensions.displayLargeSize,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),
      displayMedium: TextStyle(
          fontSize: Dimensions.displayMediumSize,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),
      displaySmall: TextStyle(
          fontSize: Dimensions.displaySmallSize,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),

      // Headline styles
      headlineLarge: TextStyle(
          fontSize: Dimensions.headlineLargeSize,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),
      headlineMedium: TextStyle(
          fontSize: Dimensions.headlineMediumSize,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),
      headlineSmall: TextStyle(
          fontSize: Dimensions.headlineSmallSize,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),

      // Title styles
      titleLarge: TextStyle(
          fontSize: Dimensions.titleLargeSize,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),
      titleMedium: TextStyle(
          fontSize: Dimensions.titleMediumSize,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),
      titleSmall: TextStyle(
          fontSize: Dimensions.titleSmallSize,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),

      // Body styles
      bodyLarge: TextStyle(
          fontSize: Dimensions.bodyLargeSize,
          fontWeight: FontWeight.normal,
          color: Colors.black
      ),
      bodyMedium: TextStyle(
          fontSize: Dimensions.bodyMediumSize,
          fontWeight: FontWeight.normal,
          color: Colors.black
      ),
      bodySmall: TextStyle(
          fontSize: Dimensions.bodySmallSize,
          fontWeight: FontWeight.normal,
          color: Colors.black
      ),

      // Label styles
      labelLarge: TextStyle(
          fontSize: Dimensions.labelLargeSize,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),
      labelMedium: TextStyle(
          fontSize: Dimensions.labelMediumSize,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),
      labelSmall: TextStyle(
          fontSize: Dimensions.labelSmallSize,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),
    ),

    appBarTheme:  AppBarTheme(

      backgroundColor: Colors.white,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
    // iconTheme: const IconThemeData(color: Colors.blue),
    // inputDecorationTheme: const InputDecorationTheme(
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: Colors.blue),
    //   ),
    //   border: OutlineInputBorder(),
    // ),
  );

  // Dark theme settings with Material 3
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true, // Enable Material 3
    fontFamily: GoogleFonts.inter().fontFamily,

    // Define color scheme and text theme
    textTheme: TextTheme(
      // Display styles
      displayLarge: TextStyle(
          fontSize: Dimensions.displayLargeSize,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),
      displayMedium: TextStyle(
          fontSize: Dimensions.displayMediumSize,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),
      displaySmall: TextStyle(
          fontSize: Dimensions.displaySmallSize,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),

      // Headline styles
      headlineLarge: TextStyle(
          fontSize: Dimensions.headlineLargeSize,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),
      headlineMedium: TextStyle(
          fontSize: Dimensions.headlineMediumSize,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),
      headlineSmall: TextStyle(
          fontSize: Dimensions.headlineSmallSize,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),

      // Title styles
      titleLarge: TextStyle(
          fontSize: Dimensions.titleLargeSize,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),
      titleMedium: TextStyle(
          fontSize: Dimensions.titleMediumSize,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),
      titleSmall: TextStyle(
          fontSize: Dimensions.titleSmallSize,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),

      // Body styles
      bodyLarge: TextStyle(
          fontSize: Dimensions.bodyLargeSize,
          fontWeight: FontWeight.normal,
          color: Colors.black
      ),
      bodyMedium: TextStyle(
          fontSize: Dimensions.bodyMediumSize,
          fontWeight: FontWeight.normal,
          color: Colors.black
      ),
      bodySmall: TextStyle(
          fontSize: Dimensions.bodySmallSize,
          fontWeight: FontWeight.normal,
          color: Colors.black
      ),

      // Label styles
      labelLarge: TextStyle(
          fontSize: Dimensions.labelLargeSize,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),
      labelMedium: TextStyle(
          fontSize: Dimensions.labelMediumSize,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),
      labelSmall: TextStyle(
          fontSize: Dimensions.labelSmallSize,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),
    ),

    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: Colors.blue),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      border: OutlineInputBorder(),
    ),
  );
}