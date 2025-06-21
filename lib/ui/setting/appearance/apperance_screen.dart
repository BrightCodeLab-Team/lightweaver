// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/strings.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';
import 'package:lightweaver/ui/root_screen/root_screen.dart';
import 'package:lightweaver/ui/setting/appearance/apperance_view_model.dart';

import 'package:provider/provider.dart';

class ApperanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApperanceViewModel>(
      builder:
          (context, model, child) => Scaffold(
            ///
            /// Start Body
            ///
            body: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    color: blackColor.withOpacity(0.59),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(AppAssets().setting2Screen),
                      Positioned(
                        top: 16,
                        left: 16,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.orange,
                            size: 30,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => NotificationScreen());
                          },
                          child: Icon(
                            Icons.notifications,
                            color: primaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          // height: MediaQuery.sizeOf(context).height * 0.9,
                          margin: const EdgeInsets.only(top: 70, bottom: 50),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 15,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Appearance",
                                  style: style18B.copyWith(color: primaryColor),
                                ),
                                10.verticalSpace,
                                Text(
                                  "Customize how the application looks.",
                                  style: style14.copyWith(
                                    color: lightGreyColor,
                                  ),
                                ),

                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    border: Border.all(
                                      width: 1,
                                      color: borderColor,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Theme", style: style16B),
                                      20.verticalSpace,
                                      _theme(
                                        onTap:
                                            () =>
                                                model.setTheme(ThemeMode.light),
                                        color:
                                            model.isLightSelected
                                                ? primaryColor
                                                : whiteColor,
                                        text: 'Light',
                                        img: '$iconsAssets/lightTheme.png',
                                        textColor:
                                            model.isLightSelected
                                                ? whiteColor
                                                : blackColor,
                                        ImageColor:
                                            model.isLightSelected
                                                ? whiteColor
                                                : blackColor,
                                      ),
                                      _theme(
                                        onTap:
                                            () =>
                                                model.setTheme(ThemeMode.dark),
                                        color:
                                            model.isLightSelected
                                                ? whiteColor
                                                : primaryColor,
                                        text: 'Dark',
                                        img: '$iconsAssets/brightTheme.png',
                                        textColor:
                                            model.isLightSelected
                                                ? blackColor
                                                : whiteColor,
                                        ImageColor:
                                            model.isLightSelected
                                                ? blackColor
                                                : whiteColor,
                                      ),
                                    ],
                                  ),
                                ),

                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.offAll(
                                        () => RootScreen(selectedScreen: 4),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 16,
                                      ),
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 30,
                                      ),
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        'Save Changes',
                                        style: style14B.copyWith(
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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

_theme({
  VoidCallback? onTap,
  Color? color,
  String? text,
  String? img,
  Color? textColor,
  Color? ImageColor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 1, color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset("$img", scale: 2, color: ImageColor),
          10.verticalSpace,
          Text("$text", style: style16B.copyWith(color: textColor)),
        ],
      ),
    ),
  );
}
