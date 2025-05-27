// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/custom_widget/button.dart';
import 'package:lightweaver/custom_widget/social_button.dart';
import 'package:lightweaver/ui/auth/forget_screens/forget_screen.dart';
import 'package:lightweaver/ui/auth/sign_in/sign_in_view_model.dart';
import 'package:lightweaver/ui/auth/sign_up/sign_up_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInViewModel(),
      child: Consumer<SignInViewModel>(
        builder:
            (context, model, child) => ModalProgressHUD(
              inAsyncCall: model.state == ViewState.busy,
              progressIndicator: CircularProgressIndicator(color: primaryColor),

              child: Scaffold(
                body: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 60),
                          height: MediaQuery.of(context).size.height,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              ///
                              /// Background Image
                              ///
                              Image.asset(
                                AppAssets().signIn,
                                width: double.infinity,
                                height: 300, // Adjust as needed
                                fit: BoxFit.cover,
                              ),

                              ///
                              /// Text in the center of image
                              ///
                              Positioned.fill(
                                top: 100,
                                left: 20,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Welcome Back',
                                      style: style25B.copyWith(
                                        color: primaryColor,
                                      ),
                                    ),
                                    Text(
                                      'Sign in to continue your healing\n journey',
                                      style: style14.copyWith(
                                        color: whiteColor,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),

                              ///
                              /// White container (bottom) overlapping image
                              ///
                              Positioned(
                                top: 200, // Should slightly overlap image
                                left: 10,
                                right: 10,
                                bottom: 0, // 👈 Add space below container
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    top: 16,
                                  ),

                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(5.02, 4.02),
                                        color: Color(
                                          0XFFA1A1A1,
                                        ).withOpacity(0.25),
                                        blurRadius: 8.04,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(29),
                                  ),
                                  child: SingleChildScrollView(
                                    // physics: NeverScrollableScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Email',
                                          style: style14.copyWith(
                                            color: primaryColor,
                                          ),
                                        ),
                                        10.verticalSpace,
                                        TextFormField(
                                          onChanged: (value) {
                                            model.appUser.email = value;
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter phone number';
                                            }
                                            return null;
                                          },
                                          decoration: authFieldDecoration
                                              .copyWith(
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
                                        TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter password';
                                            } else if (value.length < 6) {
                                              return 'Password must be at least 6 characters';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            model.appUser.password = value;
                                          },
                                          obscureText: model.obscurePassword,
                                          decoration: authFieldDecoration.copyWith(
                                            hintText: 'Enter Password',
                                            prefixIcon: Image.asset(
                                              AppAssets().keyIcon,
                                              scale: 4,
                                            ),
                                            suffixIcon: GestureDetector(
                                              onTap:
                                                  () =>
                                                      model
                                                          .togglePasswordVisibility(),
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
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: TextButton(
                                            onPressed: () {
                                              Get.to(() => ForgetScreen());
                                            },
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
                                            if (_formKey.currentState!
                                                .validate()) {
                                              FocusScope.of(context).unfocus();
                                              model.userLogin();
                                            }
                                          },
                                        ),
                                        20.verticalSpace,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Don\'t have an account? ',
                                              style: style14.copyWith(
                                                color: lightGreyColor,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap:
                                                  () => Get.to(
                                                    () => SignUpScreen(),
                                                  ),
                                              child: Text(
                                                'SIGN UP',
                                                style: style14B.copyWith(
                                                  color: primaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        30.verticalSpace,
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Divider(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                  ),
                                              child: Text('OR', style: style14),
                                            ),
                                            Expanded(
                                              child: Divider(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        30.verticalSpace,
                                        Align(
                                          alignment: Alignment.center,
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
                                          children: [
                                            CustomSocialButton(
                                              onTap:
                                                  () =>
                                                      model.userFacebookLogin
                                                      (),
                                              imagePath:
                                                  AppAssets().facebookIcon,
                                            ),
                                            10.horizontalSpace,
                                            CustomSocialButton(
                                              onTap:
                                                  () =>
                                                      model
                                                          .userLoginWithGoogle(),
                                              imagePath: AppAssets().googleIcon,
                                            ),
                                            10.horizontalSpace,
                                            CustomSocialButton(
                                              onTap:
                                                  () => print(
                                                    'Apple signUp in Progress',
                                                  ),
                                              imagePath: AppAssets().appleIcon,
                                            ),
                                          ],
                                        ),
                                        20.verticalSpace,
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // ✅ Bottom-left corner image
                              // Positioned(
                              //   bottom: -20,
                              //   left: -20,

                              //   child: Image.asset(AppAssets().onboardCornor, scale: 4),
                              // ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            AppAssets().onboardCornor,
                            scale: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
