import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/custom_widget/button.dart';
import 'package:lightweaver/ui/auth/sign_in/sign_in_view_model.dart';
import 'package:lightweaver/ui/auth/sign_up/sign_up_screen.dart';
import 'package:lightweaver/ui/home/home_screen.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInViewModel(),
      child: Consumer<SignInViewModel>(
        builder:
            (context, value, child) => Scaffold(
              body: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(AppAssets().signIn, scale: 4),
                      Positioned(
                        top: 130.h,
                        left: 10.w,
                        child: Text(
                          'Welcome Back',
                          style: style25B.copyWith(color: primaryColor),
                        ),
                      ),
                      Positioned(
                        top: 170.h,
                        left: 10.w,
                        child: Text(
                          'Sign in to continue your healing\n journey',
                          style: style14.copyWith(color: whiteColor),
                        ),
                      ),
                      Positioned(
                        top: 230.h,
                        child: Expanded(
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
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    20.verticalSpace,
                                    Text(
                                      'Phone Number',
                                      style: style14.copyWith(
                                        color: primaryColor,
                                      ),
                                    ),
                                    10.verticalSpace,

                                    ///
                                    ///     phone number
                                    ///
                                    TextFormField(
                                      decoration: authFieldDecoration.copyWith(
                                        hintText: 'Enter Phone Number',
                                        prefixIcon: Image.asset(
                                          AppAssets().phoneIcon,
                                          scale: 4,
                                        ),
                                      ),
                                    ),
                                    20.verticalSpace,
                                    Text(
                                      'Password',
                                      style: style14.copyWith(
                                        color: primaryColor,
                                      ),
                                    ),
                                    10.verticalSpace,

                                    ///
                                    ///       password
                                    ///
                                    TextFormField(
                                      decoration: authFieldDecoration.copyWith(
                                        hintText: 'Enter Phone Number',
                                        prefixIcon: Image.asset(
                                          AppAssets().keyIcon,
                                          scale: 4,
                                        ),
                                        suffixIcon: Icon(
                                          Icons.remove_red_eye,
                                          color: lightGreyColor,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                    20.verticalSpace,
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Forget Password?',
                                          style: style14.copyWith(
                                            color: lightGreyColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    40.verticalSpace,
                                    CustomButton(
                                      text: 'Get Start',
                                      onTap: () {
                                        Get.to(HomeScreen());
                                      },
                                    ),
                                    20.verticalSpace,
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Don\'t have an account ',
                                          style: style16.copyWith(
                                            color: lightGreyColor,
                                          ),
                                        ),
                                        3.horizontalSpace,
                                        GestureDetector(
                                          onTap: () {
                                            print('going to sign up screen ');
                                            // Get.to(SignUpScreen());
                                            Get.to(() => SignUpScreen());
                                          },
                                          child: Text(
                                            "SIGN UP ",
                                            style: style16.copyWith(
                                              color: primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    30.verticalSpace,

                                    ///     or text both sided line
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .center, // Center the content
                                      children: [
                                        Container(
                                          width:
                                              155, // Set the width of the line
                                          height: 1.0,
                                          color: Colors.grey, // Line color
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ), // Space around the text
                                          child: Text(
                                            'OR',
                                            style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              150, // Set the width of the line
                                          height: 1.0,
                                          color: Colors.grey, // Line color
                                        ),
                                      ],
                                    ),
                                    30.verticalSpace,
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'Continue with',
                                        style: style16.copyWith(
                                          color: blackColor,
                                        ),
                                      ),
                                    ),
                                    20.verticalSpace,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomSocialButton(
                                          onTap: () {
                                            print('Google signUp in Progress');
                                          },
                                          imagePath: AppAssets().facebookIcon,
                                        ),
                                        10.horizontalSpace,
                                        CustomSocialButton(
                                          onTap: () {
                                            print(
                                              'facebook signUp in Progress',
                                            );
                                          },
                                          imagePath: AppAssets().googleIcon,
                                        ),
                                        10.horizontalSpace,
                                        CustomSocialButton(
                                          onTap: () {
                                            print('apple signUp in Progress');
                                          },
                                          imagePath: AppAssets().appleIcon,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(AppAssets().onboardCornor, scale: 5),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

class CustomSocialButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  const CustomSocialButton({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        width: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: blackColor),
        ),
        child: Center(child: Image.asset(imagePath, scale: 4)),
      ),
    );
  }
}
