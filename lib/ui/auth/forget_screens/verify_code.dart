// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/custom_widget/button.dart';
import 'package:lightweaver/ui/auth/forget_screens/password_reset.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodeScreen extends StatelessWidget {
  String? email;
  VerifyCodeScreen({required this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,

      ///
      /// APP BAR
      ///
      appBar: AppBar(
        backgroundColor: transparentColor,
        shadowColor: transparentColor,
        surfaceTintColor: transparentColor,
        title: Text(
          'OTP',
          style: style16.copyWith(
            fontWeight: FontWeight.w600,
            color: blackColor,
          ),
        ),

        automaticallyImplyLeading: true,
      ),

      ///
      /// START BODY
      ///
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Text(
              'Check your email',
              style: style16.copyWith(
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
            10.verticalSpace,
            Text(
              'We sent a reset link to $email\n enter 5 digit code that mentioned in the email',
              style: style14.copyWith(fontSize: 12, color: mediumGreyColor),
            ),

            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 45,
                  fieldWidth: 45,
                  activeFillColor: whiteColor,
                  selectedFillColor: whiteColor,
                  inactiveFillColor: whiteColor,
                  inactiveColor: pinFieldBorderColor,
                  selectedColor: pinFieldBorderColor,
                  activeColor: pinFieldBorderColor,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {
                  print("Completed: $v");
                },
                onChanged: (value) {
                  print(value);
                },
              ),
            ),

            30.verticalSpace,
            CustomButton(
              text: 'Verify Code',
              onTap: () {
                Get.to(PasswordResetScreen());
              },
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Haven’t got the email yet? ',
                  style: style14.copyWith(
                    fontSize: 12.sp,
                    color: mediumGreyColor,
                  ),
                ),
                Text(
                  'Resend email',
                  style: style14.copyWith(
                    fontSize: 12.sp,
                    color: darkBlueColor.withOpacity(0.3),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
