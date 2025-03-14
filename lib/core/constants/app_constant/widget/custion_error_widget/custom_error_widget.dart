

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:create_order_app/core/core.dart';


class CustomErrorWidget extends StatelessWidget {
  final String? message;

  const CustomErrorWidget({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(PhosphorIcons.warning()),
            //SvgPicture.asset(AppSvgIcons.splashLogo, color: AppColors.blue100, width: 32.w, height: 32.h,),
            10.verticalSpace,
            AppTexts.text(text: message??"Unknown error",
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              fontSize: Dimensions.bodyMediumSize
            )
            // CustomTexts.textWithLineHeight(
            //   textOverflow: TextOverflow.visible,
            //   textAlign: TextAlign.center,
            //   fontSize: Dimensions.isMobile() ? Dimensions.fontSize14 : Dimensions.fontSize10,
            //   text: message
            // )
          ],
        ),
      ),
    );
  }
}