import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/custom_widget/button.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            150.verticalSpace,
            Text(
              'Check your email',
              style: style16.copyWith(
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
            20.verticalSpace,
            Text(
              'We sent a reset link to alpha...@gmail.com\nenter 5 digit code that mentioned in the email',
              style: style14.copyWith(fontSize: 12, color: mediumGreyColor),
            ),

            20.verticalSpace,
            TextFormField(
              decoration: forgetAuthFieldDecoration.copyWith(
                hintText: 'Enter Your Email',
              ),
            ),
            30.verticalSpace,
            CustomButton(text: 'Verify Code', onTap: () {}),
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
