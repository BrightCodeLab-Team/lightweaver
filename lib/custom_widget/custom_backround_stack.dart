import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/auth_text_feild.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';

class CustomBackgroundStack extends StatelessWidget {
  final String backgroundImage;
  // final String notificationIcon;
  //final VoidCallback onNotificationTap;
  final String title;

  final bool showSearchField;
  final String? hintText;
  final TextEditingController? controller;
  final bool isFieldEnabled;

  const CustomBackgroundStack({
    super.key,
    required this.backgroundImage,
    //required this.notificationIcon,
    //required this.onNotificationTap,
    required this.title,
    this.showSearchField = false,
    this.hintText,
    this.controller,
    this.isFieldEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(backgroundImage, scale: 4),
        Positioned(
          right: 10,
          top: 30,
          child: GestureDetector(
            onTap: () {
              Get.to(NotificationScreen());
            },
            child: Image.asset(AppAssets().notificationIcon, scale: 4),
          ),
        ),
        Positioned(
          top: 200.h,
          left: 10.w,
          right: 10.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: style25B.copyWith(color: primaryColor)),
              if (showSearchField) ...[
                SizedBox(height: 10.h),
                TextFormField(
                  controller: controller,
                  enabled: isFieldEnabled,
                  decoration: authFieldDecoration.copyWith(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: hintText ?? 'Search...',
                    suffixIcon: Icon(Icons.search, color: blackColor, size: 20),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
