// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/custom_widget/button.dart';
import 'package:lightweaver/ui/auth/sign_in/sign_in_screen.dart';

class PasswordResetSuccessfulScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset(AppAssets().Successmark, scale: 4),
            20.verticalSpace,
            Text(
              'Successful Send the link on your email',
              style: style16.copyWith(color: blackColor),
            ),
            20.verticalSpace,

            // Text(
            //   textAlign: TextAlign.center,
            //   'Congratulations! Your password has\nbeen changed. Click continue to login',
            //   style: style14.copyWith(fontSize: 12.sp, color: mediumGreyColor),
            // ),
            // 20.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                text: 'Back to SignIn',
                onTap: () {
                  Get.offAll(SignInScreen());
                  print('button got pressed');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
