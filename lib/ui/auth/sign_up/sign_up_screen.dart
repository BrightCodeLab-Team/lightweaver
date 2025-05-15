import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/custom_widget/button.dart';
import 'package:lightweaver/ui/auth/sign_in/sign_in_screen.dart';
import 'package:lightweaver/ui/auth/sign_up/sign_up_view_model.dart';
import 'package:lightweaver/ui/home/home_screen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder:
            (context, model, child) => Scaffold(
              resizeToAvoidBottomInset:
                  false, // Prevent resize when keyboard appears
              body: Form(
                key: formkey,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(AppAssets().signUp, scale: 4),
                            Positioned(
                              top: 80.h,
                              left: 10.w,
                              child: Text(
                                'Welcome Back',
                                style: style25B.copyWith(color: primaryColor),
                              ),
                            ),
                            Positioned(
                              top: 130.h,
                              left: 10.w,
                              child: Text(
                                'Join the community og healers',
                                style: style14.copyWith(color: whiteColor),
                              ),
                            ),
                            Positioned(
                              top: 180.h,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                ),
                                child: Container(
                                  height: 603.h,
                                  width: 1.sw * 0.9,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(29),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          20.verticalSpace,
                                          Text(
                                            'Name',
                                            style: style14.copyWith(
                                              color: primaryColor,
                                            ),
                                          ),
                                          10.verticalSpace,

                                          ///
                                          ///    name
                                          ///
                                          TextFormField(
                                            decoration: authFieldDecoration
                                                .copyWith(
                                                  hintText: 'Enter your name',
                                                ),
                                          ),
                                          20.verticalSpace,
                                          Text(
                                            'Email',
                                            style: style14.copyWith(
                                              color: primaryColor,
                                            ),
                                          ),
                                          10.verticalSpace,

                                          ///
                                          ///      email
                                          ///
                                          TextFormField(
                                            decoration: authFieldDecoration
                                                .copyWith(
                                                  hintText: 'Enter your Email',
                                                ),
                                            controller: model.emailController,
                                          ),
                                          20.verticalSpace,
                                          Text(
                                            'Password',
                                            style: style14.copyWith(
                                              color: primaryColor,
                                            ),
                                          ),
                                          10.verticalSpace,
                                          TextFormField(
                                            decoration: authFieldDecoration
                                                .copyWith(
                                                  hintText:
                                                      'Enter your password',
                                                ),
                                          ),
                                          20.verticalSpace,
                                          Text(
                                            'Practitioner Type',
                                            style: style14.copyWith(
                                              color: primaryColor,
                                            ),
                                          ),
                                          10.verticalSpace,
                                          TextFormField(
                                            readOnly: true,
                                            decoration: authFieldDecoration.copyWith(
                                              suffixIcon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: primaryColor,
                                              ),
                                              hintText:
                                                  'Enter your practitioner type',
                                              hintStyle: style16.copyWith(
                                                color: Color(0xff454545),
                                              ),
                                            ),
                                          ),
                                          20.verticalSpace,
                                          Text(
                                            'Country',
                                            style: style14.copyWith(
                                              color: primaryColor,
                                            ),
                                          ),
                                          10.verticalSpace,
                                          TextFormField(
                                            readOnly: true,
                                            decoration: authFieldDecoration
                                                .copyWith(
                                                  suffixIcon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: primaryColor,
                                                  ),
                                                  hintText:
                                                      'Select your country',
                                                  hintStyle: style16.copyWith(
                                                    color: blackColor,
                                                  ),
                                                ),
                                          ),
                                          20.verticalSpace,
                                          CustomButton(
                                            text: 'Create Account',
                                            onTap:
                                                () =>
                                                    Get.to(() => HomeScreen()),
                                          ),
                                          20.verticalSpace,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(bottom: 60.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: style14.copyWith(color: darkGreyColor),
                              ),
                              GestureDetector(
                                onTap: () => Get.to(() => SignInScreen()),
                                child: Text(
                                  'Sign In',
                                  style: style14.copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Image.asset(AppAssets().onboardCornor, scale: 4),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
