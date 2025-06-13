import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/custom_widget/button.dart';
import 'package:lightweaver/ui/auth/forget_screens/forget_view_model.dart';
import 'package:provider/provider.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return ChangeNotifierProvider(
      create: (context) => ForgetViewModel(),
      child: Consumer<ForgetViewModel>(
        builder:
            (context, model, child) => Scaffold(
              backgroundColor: whiteColor,

              ///
              /// APP BAR
              ///
              appBar: AppBar(
                backgroundColor: transparentColor,
                shadowColor: transparentColor,
                surfaceTintColor: transparentColor,
                title: Text(
                  'Forget Password',
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
              body: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Text(
                        'Forget Password',
                        style: style16.copyWith(
                          fontWeight: FontWeight.w600,
                          color: blackColor,
                        ),
                      ),
                      10.verticalSpace,
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
                        controller: model.emailController,
                        decoration: forgetAuthFieldDecoration.copyWith(
                          hintText: 'Enter Your Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!value.contains('@') ||
                              !value.contains('.')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),

                      30.verticalSpace,
                      CustomButton(
                        text: 'Reset Password',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            model.resetPassword();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
