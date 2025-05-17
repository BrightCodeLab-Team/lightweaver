import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/custom_widget/button.dart';
import 'package:lightweaver/ui/auth/forget_screens/forget_view_model.dart';
import 'package:lightweaver/ui/auth/forget_screens/verify_code.dart';
import 'package:provider/provider.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgetViewModel(),
      child: Consumer<ForgetViewModel>(
        builder:
            (context, model, child) => Scaffold(
              backgroundColor: whiteColor,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    150.verticalSpace,
                    Text(
                      'Forget Password',
                      style: style16.copyWith(
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                      ),
                    ),
                    20.verticalSpace,
                    Text(
                      'Please enter your email to reset the password',
                      style: style14.copyWith(
                        fontSize: 12,
                        color: mediumGreyColor,
                      ),
                    ),
                    20.verticalSpace,
                    Text(
                      'Enter Your Email',
                      style: style16.copyWith(
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                      ),
                    ),
                    10.verticalSpace,
                    TextFormField(
                      decoration: forgetAuthFieldDecoration.copyWith(
                        hintText: 'Enter Your Email',
                      ),
                    ),
                    30.verticalSpace,
                    CustomButton(
                      text: 'Reset Password',
                      onTap: () {
                        Get.to(VerifyCodeScreen());
                      },
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
