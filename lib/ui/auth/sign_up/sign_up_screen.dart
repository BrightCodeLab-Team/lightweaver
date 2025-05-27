// ignore_for_file: deprecated_member_use, unnecessary_string_interpolations

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/custom_widget/button.dart';
import 'package:lightweaver/ui/auth/sign_in/sign_in_screen.dart';
import 'package:lightweaver/ui/auth/sign_up/sign_up_view_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder:
            (context, model, child) => ModalProgressHUD(
              inAsyncCall: model.state == ViewState.busy,
              progressIndicator: CircularProgressIndicator(color: primaryColor),
              child: Scaffold(
                ///
                /// Start Body
                ///
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
                                        fontSize:
                                            25.sp, // Explicitly set font size
                                      ),
                                    ),
                                    Text(
                                      'Join the community of healers',
                                      style: style14.copyWith(
                                        color: whiteColor,
                                        fontSize:
                                            14.sp, // Explicitly set font size
                                      ),
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
                                          'Name',
                                          style: style14.copyWith(
                                            color: primaryColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        10.verticalSpace,
                                        TextFormField(
                                          onChanged: (value) {
                                            model.appUser.name = value;
                                          },

                                          decoration: authFieldDecoration
                                              .copyWith(
                                                hintText: 'Enter your name',
                                                hintStyle: style16.copyWith(
                                                  color: hintTextColor,
                                                ),
                                              ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your name';
                                            }
                                            return null;
                                          },
                                        ),
                                        20.verticalSpace,
                                        Text(
                                          'Email',
                                          style: style14.copyWith(
                                            color: primaryColor,
                                            fontSize: 14.sp,
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
                                              return 'Please enter your email';
                                            }
                                            if (!GetUtils.isEmail(value)) {
                                              // GetX ka email validator
                                              return 'Please enter a valid email';
                                            }
                                            return null;
                                          },
                                          decoration: authFieldDecoration
                                              .copyWith(
                                                hintText: 'Enter your Email',
                                                hintStyle: style16.copyWith(
                                                  color: hintTextColor,
                                                ),
                                              ),
                                        ),
                                        20.verticalSpace,
                                        Text(
                                          'Password',
                                          style: style14.copyWith(
                                            color: primaryColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        10.verticalSpace,
                                        TextFormField(
                                          onChanged: (value) {
                                            model.appUser.password = value;
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your password';
                                            }
                                            if (value.length < 6) {
                                              return 'Password must be at least 6 characters';
                                            }
                                            return null;
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
                                        20.verticalSpace,
                                        Text(
                                          'Practitioner Type',
                                          style: style14.copyWith(
                                            color: primaryColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        10.verticalSpace,

                                        ///
                                        ///      practitioner
                                        ///
                                        TextFormField(
                                          controller:
                                              model
                                                  .practitionerTypeController, // ✅ Use controller
                                          readOnly: true,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please select practitioner type';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            model.appUser.practitionerType =
                                                value;
                                          },
                                          onTap:
                                              () => showPractitionerTypePicker(
                                                context,
                                                model,
                                              ), // ✅ Show picker on tap
                                          decoration: authFieldDecoration.copyWith(
                                            suffixIcon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: primaryColor,
                                            ),
                                            hintText:
                                                'Enter your practitioner type',
                                            hintStyle: style16.copyWith(
                                              color: Color(0xff454545),
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ),

                                        20.verticalSpace,
                                        Text(
                                          'Country',
                                          style: style14.copyWith(
                                            color: primaryColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        10.verticalSpace,

                                        ///
                                        ///  select country
                                        ///
                                        TextFormField(
                                          controller: model.countryController,
                                          onChanged: (value) {
                                            model.appUser.country = value;
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please select your country';
                                            }
                                            return null;
                                          },

                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            showCustomCountryPicker(context, (
                                              selectedCountry,
                                            ) {
                                              model.selectCountry(
                                                selectedCountry,
                                              );

                                              model.appUser.country =
                                                  "${selectedCountry.name}";
                                            });
                                          },
                                          readOnly: true,
                                          decoration: authFieldDecoration.copyWith(
                                            suffixIcon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: primaryColor,
                                            ),
                                            hintText: 'Select your country',
                                            hintStyle: style16.copyWith(
                                              color: blackColor,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ),

                                        20.verticalSpace,
                                        CustomButton(
                                          text: 'Create Account',
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              model.resgisterUser();
                                            }
                                          },
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
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Image.asset(
                                AppAssets().onboardCornor,
                                scale: 4,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: style14,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.offAll(SignInScreen());
                                  },
                                  child: Text(
                                    "Sign In",
                                    style: style14B.copyWith(
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ],
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
    );
  }
}

///
///      practitioner bottom sheet
///
void showPractitionerTypePicker(BuildContext context, SignUpViewModel model) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: whiteColor,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:
              model.practitionerTypes.map((type) {
                return ListTile(
                  title: Text(type, style: style16),
                  onTap: () {
                    model.selectPractitionerType(type);
                    model.appUser.practitionerType = type;
                    Navigator.pop(context);
                  },
                );
              }).toList(),
        ),
      );
    },
  );
}

///
///    country picker bottom sheet
///
void showCustomCountryPicker(BuildContext context, Function(Country) onSelect) {
  List<Country> countryList = CountryService().getAll(); // fetch all country
  List<Country> filteredCountries = List.from(
    countryList,
  ); // after search filter fetch country list

  Country? selectedCountry;

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: whiteColor,
    scrollControlDisabledMaxHeightRatio: 2,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: MediaQuery.sizeOf(context).height * 0.8,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  title: Center(
                    child: Text(
                      "Select Country",
                      style: style25.copyWith(color: blackColor),
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.cancel, size: 25, color: blackColor),
                  ),
                ),
                20.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Country',
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                        color: lightGreyColor,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                    onChanged: (query) {
                      setState(() {
                        filteredCountries =
                            countryList
                                .where(
                                  (country) => country.name
                                      .toLowerCase()
                                      .contains(query.toLowerCase()),
                                )
                                .toList();
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: filteredCountries.length,
                    separatorBuilder:
                        (context, index) => Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                          height: 1,
                        ),
                    itemBuilder: (context, index) {
                      Country country = filteredCountries[index];
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        title: Text(country.name, style: style16),
                        trailing:
                            selectedCountry == country
                                ? Icon(
                                  Icons.check_circle,
                                  size: 25.sp,
                                  color: primaryColor,
                                ) // ✅ Show check icon
                                : null,
                        onTap: () {
                          setState(() {
                            selectedCountry =
                                country; // ✅ Update selected country
                          });
                          onSelect(country);
                        },
                      );
                    },
                  ),
                ),
                CustomButton(
                  text: "Done",
                  onTap: () {
                    Navigator.pop(context, selectedCountry);
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
