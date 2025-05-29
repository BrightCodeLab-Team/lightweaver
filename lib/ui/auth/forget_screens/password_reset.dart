import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/custom_widget/button.dart';
import 'package:lightweaver/ui/auth/forget_screens/set_new_password.dart';

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({super.key});

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
          'Password Reset',
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Text('Password reset', style: style16.copyWith(color: blackColor)),
            10.verticalSpace,
            Text(
              'Your password has been successfully reset. click\nconfirm to set a new password',
              style: style14.copyWith(fontSize: 12.sp, color: mediumGreyColor),
            ),
            20.verticalSpace,
            CustomButton(
              text: 'Confirm',
              onTap: () {
                Get.to(SetNewPasswordScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
