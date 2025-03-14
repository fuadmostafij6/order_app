


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:create_order_app/core/core.dart';

class AppButton{
  AppButton._();
  static Widget filledButton ({
    VoidCallback? onPressed,
    required bool load,
    required String text,
    Color? bgColor,
    Color? txtColor,
    Color? splashColor,
    int? maxLine,
    TextAlign? textAlign,
    TextOverflow? overflow,
    double? fontSize,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    double? letterSpacing
  }) {
    return FilledButton(
      onPressed: onPressed, // Disable button if not enabled
      style: ButtonStyle(
        enableFeedback: true,
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          // Set background color based on the button state
          if (states.contains(WidgetState.pressed)) {
            return splashColor??AppColors.brand500;
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.gray100;
          }
          return bgColor??AppColors.primary;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          // Set background color based on the button state
          if (states.contains(WidgetState.pressed)) {
            return splashColor??AppColors.brand500;
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.gray100;
          }
          return bgColor??AppColors.primary;
        }),
        textStyle: WidgetStateProperty.resolveWith((states) {
          // Set background color based on the button state

          return TextStyle(
            decoration: textDecoration,
            fontSize: fontSize ?? Dimensions.bodyMediumSize,
            fontWeight: fontWeight ?? FontWeight.w500,
            letterSpacing: letterSpacing,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          // Set text color based on the button state
          if (states.contains(WidgetState.disabled)) {
            return AppColors.gray400; // Disabled text color
          }
          return txtColor ?? AppColors.white; // Default text color
        }),
        padding: WidgetStateProperty.all<EdgeInsets>(
          REdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0), // Set height by vertical padding
        ),
      ),
      child:load?SizedBox(
          height:15.w, width:15.w,
          child: Center(child: CircularProgressIndicator(color: AppColors.white,),)): Text(
        text,
        maxLines: maxLine,
        textAlign: textAlign,
        overflow: overflow ?? TextOverflow.ellipsis,

      ),
    );
  }

  static Widget filledIconButton({
    VoidCallback? onPressed,
    required String text,
    required IconData icon,
    Color? bgColor,
    Color? color, // Shared for both icon and text
    int? maxLine,
    TextAlign? textAlign,
    TextOverflow? overflow,
    double? fontSize,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? iconSize,
    double spacing = 8.0, // Space between icon and text
  }) {
    return FilledButton.icon(
      onPressed: onPressed, // Disable button if not enabled
      style: ButtonStyle(
        enableFeedback: true,
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          // Set background color based on the button state
          if (states.contains(WidgetState.pressed)) {
            return AppColors.brand500;
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.gray100;
          }
          return bgColor ?? AppColors.brand600;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          // Set color for both icon and text based on the button state
          if (states.contains(WidgetState.disabled)) {
            return AppColors.gray400; // Disabled color
          }
          return color ?? AppColors.white; // Default color
        }),
        padding: WidgetStateProperty.all<EdgeInsets>(
          REdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0), // Set height by vertical padding
        ),
      ),
      icon: Icon(
        icon,
        size: iconSize ?? 18.0,

      ),
      label: Text(
        text,
        maxLines: maxLine,
        textAlign: textAlign,
        overflow: overflow ?? TextOverflow.ellipsis,
        style: TextStyle(
          decoration: textDecoration,
          fontSize: fontSize ?? Dimensions.bodyMediumSize,
          fontWeight: fontWeight ?? FontWeight.w500,
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }

  static Widget outlinedButton({
    VoidCallback? onPressed,
    required String text,
    required bool load,
    Color? borderColor,
    Color? txtColor,
    Color? bgColor,
    Color? splashColor,
    int? maxLine,
    TextAlign? textAlign,
    TextOverflow? overflow,
    double? fontSize,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    double? letterSpacing,
    double borderWidth = 1.0,
  }) {
    return OutlinedButton(
      onPressed: onPressed, // Disable button if not enabled
      style: ButtonStyle(
        enableFeedback: true,
        side: WidgetStateProperty.resolveWith((states) {
          // Set border color based on the button state
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: AppColors.gray100, width: borderWidth); // Disabled border color
          }
          else if(states.contains(WidgetState.pressed)) {
            return BorderSide(color: splashColor ?? AppColors.brand200, width: borderWidth);
          }
          return BorderSide(color: borderColor ?? AppColors.gray200, width: borderWidth); // Default border color
        }),

        backgroundColor: WidgetStateProperty.resolveWith((states) {
          // Set background color based on the button state
          if (states.contains(WidgetState.pressed)) {
            return splashColor??AppColors.brand50;
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.white;
          }
          return bgColor ?? AppColors.white;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          // Set background color based on the button state
          if (states.contains(WidgetState.pressed)) {
            return splashColor??AppColors.brand50;
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.white;
          }
          return bgColor ?? AppColors.white;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          // Set text color based on the button state
          if (states.contains(WidgetState.disabled)) {
            return AppColors.gray400; // Disabled text color
          }
          return txtColor ?? AppColors.brand700; // Default text color
        }),
        padding: WidgetStateProperty.all<EdgeInsets>(
          REdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0), // Set height by vertical padding
        ),
      ),
      child: load?SizedBox(
          height:15.w, width:15.w,
          child: Center(child: CircularProgressIndicator(color: AppColors.black,),)):Text(
        text,
        maxLines: maxLine,
        textAlign: textAlign,
        overflow: overflow ?? TextOverflow.ellipsis,
        style: TextStyle(
          decoration: textDecoration,

          fontSize: fontSize ?? Dimensions.bodyMediumSize,
          fontWeight: fontWeight ?? FontWeight.w500,
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }

  static Widget outlinedIconButton({
    VoidCallback? onPressed,
    required String text,
    required Widget icon,
    Color? borderColor,
    Color? txtColor,
    Color? bgColor,
    int? maxLine,
    TextAlign? textAlign,
    TextOverflow? overflow,
    double? fontSize,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? iconSize,
    double borderWidth = 1.0,
    double spacing = 8.0, // Space between icon and text
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed, // Disable button if not enabled
      style: ButtonStyle(
        side: WidgetStateProperty.resolveWith((states) {
          // Set border color based on the button state
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: AppColors.gray100, width: borderWidth); // Disabled border color
          }
          else if(states.contains(WidgetState.pressed)) {
            return BorderSide(color: borderColor ?? AppColors.brand200, width: borderWidth); // Border color when pressed
          }
          return BorderSide(color: borderColor ?? AppColors.gray200, width: borderWidth); // Default border color
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          // Set background color based on the button state
          if (states.contains(WidgetState.pressed)) {
            return AppColors.brand50;
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.white;
          }
          return bgColor ?? AppColors.white;
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          // Set background color based on the button state
          if (states.contains(WidgetState.pressed)) {
            return AppColors.brand50;
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.white;
          }
          return bgColor ?? AppColors.white;
        }),
        textStyle:WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return TextStyle(
                color: txtColor ?? AppColors.gray400,
                fontWeight: FontWeight.w500,
                fontSize: Dimensions.bodyMediumSize
            ); // Disabled text color
          }
          return TextStyle(
              color: txtColor ?? AppColors.brand700,
              fontWeight: FontWeight.w500,
              fontSize: Dimensions.bodyMediumSize
          ); // Default text color
        }),

        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.gray400; // Disabled text color
          }
          return txtColor ?? AppColors.brand700; // Default text color
        }),

        padding: WidgetStateProperty.all<EdgeInsets>(
          REdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0), // Set height by vertical padding
        ),
      ),
      icon:icon,
      label: Text(
        text,
        maxLines: maxLine,
        textAlign: textAlign,
        overflow: overflow ?? TextOverflow.ellipsis,

        // style: TextStyle(
        //   decoration: textDecoration,
        //   fontSize: fontSize ?? Dimensions.bodyMediumSize,
        //   fontWeight: fontWeight ?? FontWeight.w500,
        //   letterSpacing: letterSpacing,
        // ),
      ),
    );
  }
  static Widget textButton({
    VoidCallback? onPressed,
    bool load=false,
    required String text,
    required BuildContext context,
    Color? bgColor,
    Color? txtColor,
    Color? loadingColor,
    int? maxLine,
    TextAlign? textAlign,
    TextOverflow? overflow,
    double? fontSize,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return TextButton(
      onPressed: onPressed, // Disable button if not enabled
      style: ButtonStyle(
        enableFeedback: true,
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          // Set text color based on the button state
          if (states.contains(WidgetState.disabled)) {
            return AppColors.gray400; // Disabled text color
          }
          return txtColor ?? AppColors.brand700; // Default text color
        }),
        textStyle:WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return TextStyle(
                color: AppColors.gray400,
                fontWeight: FontWeight.w500,
                fontSize: Dimensions.bodyMediumSize
            ); // Disabled text color
          }
          return TextStyle(
              color: AppColors.brand700,
              fontWeight: FontWeight.w500,
              fontSize: Dimensions.bodyMediumSize
          ); // Default text color
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          // Set background color based on the button state
          if (states.contains(WidgetState.pressed)) {
            return AppColors.brand50;
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.white;
          }
          return bgColor ?? AppColors.white;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          // Set background color based on the button state
          if (states.contains(WidgetState.pressed)) {
            return AppColors.brand50;
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.white;
          }
          return bgColor ?? AppColors.white;
        }),
        padding: WidgetStateProperty.all<EdgeInsets>(
          REdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0), // Set height by vertical padding
        ),
      ),
      child:
      load?SizedBox(
          height:15.w, width:15.w,
          child: Center(child: CircularProgressIndicator(color: loadingColor??AppColors.white,),)):
      Text(
        text,
        maxLines: maxLine,
        textAlign: textAlign,
        overflow: overflow ?? TextOverflow.ellipsis,
        // style: TextStyle(
        //   decoration: textDecoration,
        //   fontSize: fontSize ?? Dimensions.bodyMediumSize,
        //   fontWeight: fontWeight ?? FontWeight.w500,
        //   letterSpacing: letterSpacing,
        // ),
      ),
    );
  }

  static Widget splashTextButton({
    VoidCallback? onPressed,
    required String text,
    Color? bgColor,
    Color? txtColor,
    int? maxLine,
    TextAlign? textAlign,
    TextOverflow? overflow,
    double? fontSize,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return TextButton(
      onPressed: onPressed, // Disable button if not enabled
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          // Set text color based on the button state
          if (states.contains(WidgetState.disabled)) {
            return AppColors.gray400; // Disabled text color
          }
          return txtColor ?? AppColors.brand500; // Default text color
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          // Set background color based on the button state
          if (states.contains(WidgetState.pressed)) {
            return AppColors.brand50;
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.white;
          }
          return bgColor ?? AppColors.white;
        }),
        shape:WidgetStateProperty.resolveWith((states) {
          // Set background color based on the button state

          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Default 8.0 radius
          );
        }),
        padding: WidgetStateProperty.all<EdgeInsets>(
          REdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0), // Set height by vertical padding
        ),
      ),
      child: Text(
        text,
        maxLines: maxLine,
        textAlign: textAlign,
        overflow: overflow ?? TextOverflow.ellipsis,
        style: TextStyle(
          decoration: textDecoration,
          fontSize: fontSize ?? Dimensions.bodyMediumSize,
          fontWeight: fontWeight ?? FontWeight.w500,
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }

  static Widget textIconButton({
    VoidCallback? onPressed,
    required String text,
    required IconData icon,
    Color? color, // Shared for both icon and text
    int? maxLine,
    TextAlign? textAlign,
    TextOverflow? overflow,
    double? fontSize,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? iconSize,
    double spacing = 8.0, // Space between icon and text
  }) {
    return TextButton.icon(
      onPressed: onPressed, // Disable button if not enabled
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          // Set color for both icon and text based on the button state
          if (states.contains(WidgetState.disabled)) {
            return AppColors.gray400; // Disabled color
          }
          return color ?? AppColors.brand500; // Default color
        }),
        padding: WidgetStateProperty.all<EdgeInsets>(
          REdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0), // Set height by vertical padding
        ),
      ),
      icon: Icon(
        icon,
        size: iconSize ?? 18.0,
        color: onPressed !=null? AppColors.brand700:AppColors.gray400,
      ),
      label: Text(
        text,
        maxLines: maxLine,
        textAlign: textAlign,
        overflow: overflow ?? TextOverflow.ellipsis,
        style: TextStyle(
          decoration: textDecoration,
          fontSize: fontSize ?? Dimensions.bodyMediumSize,
          fontWeight: fontWeight ?? FontWeight.w500,
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }



}