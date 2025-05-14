import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/custom_widget/button.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            150.verticalSpace,
            Text(
              'Set new Password',
              style: style16.copyWith(
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
            20.verticalSpace,
            Text(
              'Create a new password. Ensure it differs from\nprevious ones for security',
              style: style14.copyWith(fontSize: 12, color: mediumGreyColor),
            ),
            20.verticalSpace,
            Text(
              'Password',
              style: style16.copyWith(
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
            10.verticalSpace,
            TextFormField(
              decoration: forgetAuthFieldDecoration.copyWith(
                hintText: 'Enter your new password',
              ),
            ),
            20.verticalSpace,
            Text(
              'Confirm password',
              style: style16.copyWith(
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
            10.verticalSpace,
            TextFormField(
              decoration: forgetAuthFieldDecoration.copyWith(
                hintText: 'Re-enter password',
              ),
            ),
            30.verticalSpace,
            CustomButton(text: 'Reset Password', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
