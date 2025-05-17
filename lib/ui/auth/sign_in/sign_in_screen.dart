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
import 'package:lightweaver/custom_widget/social_button.dart';
import 'package:lightweaver/ui/auth/forget_screens/forget_screen.dart';
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
            (context, model, child) => Scaffold(
              body: SingleChildScrollView(
                child: Column(
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
                          bottom: 0,

                          left: 15.w, // Added left position
                          right: 15.w, // Added right position
                          child: Container(
                            // height: 603.h,
                            width: 1.sw * 0.9,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(29),
                                topRight: Radius.circular(29),
                              ),
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    _secondSection(model),
                    SizedBox(height: 20.h), // Added some space at the bottom
                    // Align(
                    //   alignment: Alignment.bottomLeft,
                    //   child: Image.asset(AppAssets().onboardCornor, scale: 4),
                    // ),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  ///
  ///
  ///
  _secondSection(SignInViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(29),
            bottomRight: Radius.circular(29),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///
              ///
              ///
              Text('Password', style: style14.copyWith(color: primaryColor)),
              10.verticalSpace,
              TextFormField(
                obscureText: model.obscurePassword,
                decoration: authFieldDecoration.copyWith(
                  hintText: 'Enter Password',
                  prefixIcon: Image.asset(AppAssets().keyIcon, scale: 4),
                  suffixIcon: GestureDetector(
                    onTap: () => model.togglePasswordVisibility(),
                    child: Icon(
                      model.obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: lightGreyColor,
                      size: 25,
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => ForgetScreen());
                  },
                  child: Text(
                    'Forget Password?',
                    style: style14.copyWith(color: lightGreyColor),
                  ),
                ),
              ),
              40.verticalSpace,
              CustomButton(
                text: 'Get Start',
                onTap: () {
                  Get.to(() => HomeScreen());
                },
              ),
              20.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account ',
                    style: style16.copyWith(color: lightGreyColor),
                  ),
                  3.horizontalSpace,
                  GestureDetector(
                    onTap: () => Get.to(() => SignUpScreen()),
                    child: Text(
                      "SIGN UP ",
                      style: style16.copyWith(color: primaryColor),
                    ),
                  ),
                ],
              ),
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 155, height: 1.0, color: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'OR',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(width: 150, height: 1.0, color: Colors.grey),
                ],
              ),
              30.verticalSpace,
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Continue with',
                  style: style16.copyWith(color: blackColor),
                ),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      print('facebook signUp in Progress');
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

              ///
              ///
            ],
          ),
        ),
      ),
    );
  }
}
