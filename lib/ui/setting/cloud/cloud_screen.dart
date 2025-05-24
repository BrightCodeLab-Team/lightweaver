// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/strings.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';
import 'package:lightweaver/ui/setting/cloud/cloud_view_model.dart';
import 'package:provider/provider.dart';

class CloudScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CloudViewModel(),
      child: Consumer<CloudViewModel>(
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
                              color: primaryColor,
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
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Configure how your data is synchronized across devices.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  _buildCloudSyncCard(model, context),
                                  const SizedBox(height: 24),
                                  _buildSyncOptionsCard(model),
                                  const SizedBox(height: 24),
                                  _buildConnectedDevicesCard(),
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
      ),
    );
  }
}

Widget _buildCloudSyncCard(CloudViewModel model, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: whiteColor,
      border: Border.all(width: 1, color: borderColor),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cloud Sync', style: style16B.copyWith(color: primaryColor)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppAssets().cloud, color: blueColor, scale: 4),
                  SizedBox(width: 8),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: Text(
                      'Keep your data in sync across all devices',
                      style: style12.copyWith(color: lightGreyColor),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Switch(
                  activeColor: Colors.blue,
                  thumbColor: WidgetStateColor.transparent,
                  value: model.isCloudSyncEnabled,
                  onChanged: (value) {
                    model.toggleCloudSync(value);
                  },
                ),
              ),
            ],
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Last synced: Today at 14:32'),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Image.asset("$iconsAssets/async.png", scale: 3),
                        10.horizontalSpace,
                        Text(
                          'All data in sync',
                          style: TextStyle(color: greenColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 0.5, color: lightGreyColor),
                  color: whiteColor,
                ),
                child: Row(children: [Icon(Icons.sync), Text('Sync Now')]),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildSyncOptionsCard(CloudViewModel model) {
  return Container(
    decoration: BoxDecoration(
      color: whiteColor,
      border: Border.all(width: 1, color: borderColor),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sync Options',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          _buildSyncOption('Documents', '23 MB', model),
          _buildSyncOption('Images', '156 MB', model),
          _buildSyncOption('Settings', '1 MB', model),
        ],
      ),
    ),
  );
}

Widget _buildSyncOption(String title, String size, CloudViewModel model) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Checkbox(
            activeColor: blueColor,
            value: model.syncOptions[title] ?? false,
            onChanged: (value) {
              model.toggleSyncOption(title, value!);
            },
          ),
          Text(title),
        ],
      ),
      Text(size),
    ],
  );
}

Widget _buildConnectedDevicesCard() {
  return Container(
    decoration: BoxDecoration(
      color: whiteColor,
      border: Border.all(width: 1, color: borderColor),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Connected Devices',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          _buildDeviceTile('MacBook Pro', 'Now', true),
          const Divider(),
          _buildDeviceTile('iPhone 13', '2 hours ago', false),
          const Divider(),
          _buildDeviceTile('iPad Pro', '3 days ago', false),
        ],
      ),
    ),
  );
}

Widget _buildDeviceTile(String name, String time, bool isCurrent) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('Last active: $time'),
        ],
      ),
      isCurrent
          ? Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Color(0xffDCFCE7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text('Current', style: style14.copyWith(color: greenColor)),
          )
          : TextButton(
            onPressed: () {},
            child: const Text('Disconnect', style: TextStyle(color: redColor)),
          ),
    ],
  );
}
