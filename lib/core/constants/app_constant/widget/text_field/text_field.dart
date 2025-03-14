

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:create_order_app/core/core.dart';
class AppTextField{
  AppTextField._();

  static Widget textFiled(
      BuildContext context, {
        ValueChanged<String?>? onChanged,

        bool obscureText = false,
        VoidCallback? onTapSuffixIcon,
        FocusNode? focusNode,
        Widget? suffixIcon,
        String? fontFamily,
        // List<RankModel> items= const[],

        TextInputType? keyboardType,
        bool enabled = true,
        String? Function(String?)? validator,
        VoidCallback? onTapPrefixIcon,
        IconData? prefixIcon,
        String? helperText,
        FontWeight? fontWeight,
        Color? textColor,
        List<TextInputFormatter>? inputFormatters,
        String ?title,
        String? hintText,
        TextEditingController? controller,
        int maxLine = 1,
        bool isPhone = false,  // New parameter to indicate if the field is for phone number
        bool rank = false,  // New parameter to indicate if the field is for phone number
      }) =>
      TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,

        inputFormatters: inputFormatters,
        focusNode: focusNode,

        onTapOutside: (event){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        style:  TextStyle(fontWeight:fontWeight?? FontWeight.normal, color:textColor?? AppColors.gray900, fontSize: Dimensions.bodyLargeSize),
        obscureText: obscureText,
        maxLines: maxLine,
        enabled: enabled,
        onChanged: onChanged,
        // onTap: onTapSuffixIcon,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          isDense: prefixIcon == null ? false : true,
          hintText: hintText ?? title,
          helperText: helperText,

          suffixIcon: suffixIcon == null
              ? null
              : GestureDetector(
            onTap: onTapSuffixIcon,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: suffixIcon,
            ),
          ),
          hintStyle: TextStyle(
            color: AppColors.gray400,
            fontSize: Dimensions.titleSmallSize,
            fontWeight: FontWeight.w400,

          ),
          labelText: title,


          labelStyle: TextStyle(
              fontSize: Dimensions.bodyLargeSize,
              color: AppColors.gray600
          ),

          //    labelText: title,

          floatingLabelBehavior: FloatingLabelBehavior.auto,


          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius12),
            borderSide: BorderSide(color: AppColors.gray200),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius12),
            borderSide: BorderSide(color: AppColors.gray200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            borderSide: BorderSide(color: AppColors.gray600),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            borderSide: BorderSide(color: AppColors.gray400),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            borderSide: BorderSide(color: AppColors.gray400),
          ),
        ),
      );




  static Widget textFiled1(
      BuildContext context, {
        ValueChanged<String?>? onChanged,

        bool obscureText = false,
        VoidCallback? onTapSuffixIcon,
        FocusNode? focusNode,
        Widget? suffixIcon,
        String? fontFamily,
        // List<RankModel> items= const[],

        TextInputType? keyboardType,
        bool enabled = true,
        String? Function(String?)? validator,
        VoidCallback? onTapPrefixIcon,
        IconData? prefixIcon,
        String? helperText,
        FontWeight? fontWeight,
        Color? textColor,
        List<TextInputFormatter>? inputFormatters,
        String ?title,
        String? hintText,
        TextEditingController? controller,
        int maxLine = 1,
        bool isPhone = false,  // New parameter to indicate if the field is for phone number
        bool rank = false,  // New parameter to indicate if the field is for phone number
      }) =>
      TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,

        inputFormatters: inputFormatters,
        focusNode: focusNode,

        onTapOutside: (event){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        style:  TextStyle(fontWeight:fontWeight?? FontWeight.normal, color:textColor?? AppColors.gray900, fontSize: Dimensions.bodyLargeSize),
        obscureText: obscureText,
        maxLines: maxLine,
        enabled: enabled,
        onChanged: onChanged,
        // onTap: onTapSuffixIcon,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          isDense: prefixIcon == null ? false : true,
          hintText: hintText ?? title,
          helperText: helperText,

          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
            color: AppColors.gray400,
            fontSize: Dimensions.titleSmallSize,
            fontWeight: FontWeight.w400,

          ),
          labelText: title,


          labelStyle: TextStyle(
              fontSize: Dimensions.bodyLargeSize,
              color: AppColors.gray600
          ),

          //    labelText: title,

          floatingLabelBehavior: FloatingLabelBehavior.auto,


          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius12),
            borderSide: BorderSide(color: AppColors.gray200),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius12),
            borderSide: BorderSide(color: AppColors.gray200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            borderSide: BorderSide(color: AppColors.gray600),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            borderSide: BorderSide(color: AppColors.gray400),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            borderSide: BorderSide(color: AppColors.gray400),
          ),
        ),
      );


  static Widget searchField(
      BuildContext context, {
        ValueChanged<String?>? onChanged,
        ValueChanged<String?>? onSubmitted,

        bool obscureText = false,
        VoidCallback? onTapSuffixIcon,
        VoidCallback? onTap,
        FocusNode? focusNode,
        Widget? suffixIcon,
        Color?borderColor,
        TextInputAction? textInputAction,

        String? fontFamily,
        // List<RankModel> items= const[],

        TextInputType? keyboardType,
        bool enabled = true,
        String? Function(String?)? validator,
        VoidCallback? onTapPrefixIcon,
        Widget? prefixIcon,
        String? helperText,
        FontWeight? fontWeight,
        Color? textColor,
        List<TextInputFormatter>? inputFormatters,
        String ?title,
        String? hintText,
        TextEditingController? controller,
        int maxLine = 1,
        bool isPhone = false,  // New parameter to indicate if the field is for phone number
        bool rank = false,  // New parameter to indicate if the field is for phone number
      }) =>
      GestureDetector(

        onTap: !enabled?onTap:null,
        child: TextFormField(
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          validator: validator,
          controller: controller,
          onFieldSubmitted:onSubmitted,


          inputFormatters: inputFormatters,
          focusNode: focusNode,
          autofocus: true,

          onTapOutside: (event){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          style:  TextStyle(fontWeight:fontWeight?? FontWeight.normal, color:textColor?? AppColors.gray900, fontSize: Dimensions.bodyLargeSize),
          obscureText: obscureText,
          maxLines: maxLine,
          enabled: enabled,
          onChanged: onChanged,
          onTap: onTap,
          // onTap: onTapSuffixIcon,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            isDense: false,
            //contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),


            hintText: hintText ?? title,
            helperText: helperText,
            prefixIcon: prefixIcon == null
                ? null
                : GestureDetector(
              onTap: onTapPrefixIcon,
              child: Padding(
                padding: REdgeInsets.all(8),
                child: prefixIcon,
              ),
            ),

            suffixIcon: suffixIcon == null
                ? null
                : Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: onTapSuffixIcon,
                child: suffixIcon,
              ),
            ),
            hintStyle: TextStyle(
              color: AppColors.gray400,
              fontSize: Dimensions.titleSmallSize,
              fontWeight: FontWeight.w400,

            ),
            labelText: title,


            labelStyle: TextStyle(
                fontSize: Dimensions.bodyLargeSize,
                color: AppColors.gray600
            ),

            //    labelText: title,

            floatingLabelBehavior: FloatingLabelBehavior.auto,


            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: borderColor??AppColors.gray200),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: borderColor??AppColors.gray200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: borderColor??AppColors.gray600),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color:borderColor?? AppColors.gray400),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: borderColor??AppColors.gray400),
            ),
          ),
        ),
      );
}