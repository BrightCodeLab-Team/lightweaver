// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/custom_widget/custom_backround_stack.dart';
import 'package:lightweaver/ui/setting/appearance/apperance_screen.dart';
import 'package:lightweaver/ui/setting/cloud/cloud_screen.dart';
import 'package:lightweaver/ui/setting/email/email_template_screen.dart';
import 'package:lightweaver/ui/setting/export_data/export_data_screen.dart';
import 'package:lightweaver/ui/setting/help_and_support/help_and_support.dart';
import 'package:lightweaver/ui/setting/profile/profile_screen.dart';
import 'package:lightweaver/ui/setting/reminder/reminder_screen.dart';

import 'package:lightweaver/ui/setting/setting_view_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingViewModel(),
      child: Consumer<SettingViewModel>(
        builder:
            (context, model, child) => ModalProgressHUD(
              inAsyncCall: model.state == ViewState.busy,
              progressIndicator: CircularProgressIndicator(color: primaryColor),
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomBackgroundStack(
                        title: "Settings",
                        backgroundImage: AppAssets().setting2Screen,
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(5.02, 4.02),
                              color: Color(0XFFA1A1A1).withOpacity(0.25),
                              blurRadius: 8.04,
                              spreadRadius: 0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(29.r),
                        ),
                        child: Column(
                          children: [
                            _settingContainer(
                              context: context,
                              icon: AppAssets().profileIcons,
                              icon1: AppAssets().profileIcons1,
                              text: 'Profile',
                              index: 0,
                            ),
                            _settingContainer(
                              context: context,
                              icon: AppAssets().email,
                              icon1: AppAssets().email1,
                              text: 'Email Templates',
                              index: 1,
                            ),
                            _settingContainer(
                              context: context,
                              icon: AppAssets().reminder,
                              icon1: AppAssets().reminder1,
                              text: 'Reminder Settings',
                              index: 2,
                            ),
                            _settingContainer(
                              context: context,
                              icon: AppAssets().cloud,
                              icon1: AppAssets().cloud1,
                              text: 'Cloud Sync',
                              index: 3,
                            ),
                            _settingContainer(
                              context: context,
                              icon: AppAssets().appearance,
                              icon1: AppAssets().appearance1,
                              text: 'Appearance',
                              index: 4,
                            ),
                            _settingContainer(
                              context: context,
                              icon: AppAssets().export,
                              icon1: AppAssets().export1,
                              text: 'Export Data',
                              index: 5,
                            ),
                            _settingContainer(
                              context: context,
                              icon: AppAssets().help,
                              icon1: AppAssets().help1,
                              text: 'Help & Support',
                              index: 6,
                            ),

                            _settingContainer(
                              context: context,
                              icon: AppAssets().export,
                              icon1: AppAssets().export1,
                              text: 'Logout',
                              index: 7,
                            ),
                          ],
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

  Widget _settingContainer({
    required BuildContext context,
    required String icon,
    required String icon1,
    required String text,
    required int index,
  }) {
    final model = Provider.of<SettingViewModel>(context, listen: false);
    final isSelected =
        Provider.of<SettingViewModel>(context).selectedIndex == index;

    return GestureDetector(
      onTap: () {
        model.updateSelectedIndex(index);
        index == 0
            ? Get.to(ProfileScreen())
            : index == 1
            ? Get.to(EmailTemplateScreen())
            : index == 2
            ? Get.to(ReminderScreen())
            : index == 3
            ? Get.to(CloudScreen())
            : index == 4
            ? Get.to(ApperanceScreen())
            : index == 5
            ? Get.to(ExportDataScreen())
            : index == 6
            ? Get.to(HelpAndSupportScreen())
            : model.lgout();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        height: 64.h,
        decoration: BoxDecoration(
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              color: Color(0XFFA1A1A1).withOpacity(0.25),
              blurRadius: 8.04,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              height: 63,
              width: 10,
              decoration: BoxDecoration(
                color: isSelected ? primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(29.r),
              ),
            ),
            20.horizontalSpace,
            Image.asset(isSelected ? icon1 : icon, scale: 4),
            10.horizontalSpace,
            Text(
              text,
              style: style16B.copyWith(
                color: isSelected ? primaryColor : blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
