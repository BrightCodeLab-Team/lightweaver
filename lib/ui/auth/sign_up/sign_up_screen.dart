import 'package:country_picker/country_picker.dart';
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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder:
            (context, model, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(AppAssets().signIn, scale: 4),
                        Positioned(
                          top: 100.h,
                          left: 10.w,
                          child: Text(
                            'Welcome Back',
                            style: style25B.copyWith(
                              color: primaryColor,
                              fontSize: 25.sp, // Explicitly set font size
                            ),
                          ),
                        ),
                        Positioned(
                          top: 140.h,
                          left: 10.w,
                          child: Text(
                            'Join the community of healers',
                            style: style14.copyWith(
                              color: whiteColor,
                              fontSize: 14.sp, // Explicitly set font size
                            ),
                          ),
                        ),
                        textFormFieldSection(),
                        // _secondSection(),
                      ],
                    ),
                    _secondSection(model),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: style14.copyWith(
                              color: darkGreyColor,
                              fontSize: 14.sp, // Explicitly set font size
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(() => SignInScreen()),
                            child: Text(
                              'Sign In',
                              style: style14.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp, // Explicitly set font size
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(AppAssets().onboardCornor, scale: 4),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  ///
  ///      this is causing layout issue due to which text form fields and button is not working
  ///
  Positioned textFormFieldSection() {
    return Positioned(
      bottom: 0.h,
      left: 15.w,
      right: 15.w,
      child: SizedBox(
        // height: 200.h,
        child: Material(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(29),
            topRight: Radius.circular(29),
          ),
          color: whiteColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                Text(
                  'Name',
                  style: style14.copyWith(color: primaryColor, fontSize: 14.sp),
                ),
                10.verticalSpace,
                TextFormField(
                  decoration: authFieldDecoration.copyWith(
                    hintText: 'Enter your name',
                    hintStyle: style16.copyWith(color: hintTextColor),
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  _secondSection(SignUpViewModel model) {
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: style14.copyWith(color: primaryColor, fontSize: 14.sp),
              ),
              10.verticalSpace,
              TextFormField(
                decoration: authFieldDecoration.copyWith(
                  hintText: 'Enter your Email',
                  hintStyle: style16.copyWith(color: hintTextColor),
                ),
              ),
              20.verticalSpace,
              Text(
                'Password',
                style: style14.copyWith(color: primaryColor, fontSize: 14.sp),
              ),
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
              Text(
                'Practitioner Type',
                style: style14.copyWith(color: primaryColor, fontSize: 14.sp),
              ),
              10.verticalSpace,

              ///
              ///      practitioner
              ///
              TextFormField(
                controller:
                    model.practitionerTypeController, // ✅ Use controller
                readOnly: true,
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
                  hintText: 'Enter your practitioner type',
                  hintStyle: style16.copyWith(
                    color: Color(0xff454545),
                    fontSize: 16.sp,
                  ),
                ),
              ),

              20.verticalSpace,
              Text(
                'Country',
                style: style14.copyWith(color: primaryColor, fontSize: 14.sp),
              ),
              10.verticalSpace,

              ///
              ///  select country
              ///
              TextFormField(
                controller: model.countryController,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  showCustomCountryPicker(context, (selectedCountry) {
                    model.selectCountry(selectedCountry);
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
                onTap: () => Get.to(() => HomeScreen()),
              ),

              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
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
      backgroundColor: Colors.white,
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
  void showCustomCountryPicker(
    BuildContext context,
    Function(Country) onSelect,
  ) {
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
      backgroundColor: Colors.white,
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
}
