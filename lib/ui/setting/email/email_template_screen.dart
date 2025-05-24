// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/strings.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';
import 'package:lightweaver/ui/setting/setting_view_model.dart';
import 'package:provider/provider.dart';

class EmailTemplateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingViewModel(),
      child: Consumer<SettingViewModel>(
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
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email Templates",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Customize email templates for different scenarios.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryColor,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                          vertical: 12.0,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      icon: const Icon(
                                        Icons.add,
                                        color: whiteColor,
                                      ),
                                      label: Text(
                                        "New Template",
                                        style: style14.copyWith(
                                          color: whiteColor,
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: model.templates.length,
                                    itemBuilder: (context, index) {
                                      final template = model.templates[index];
                                      return Card(
                                        color: whiteColor,
                                        margin: const EdgeInsets.only(
                                          bottom: 16,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        elevation: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      template['title']!,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: primaryColor,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      "Last edited: ${template['lastEdited']}",
                                                      style: TextStyle(
                                                        color: Colors.grey[600],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 10,
                                                          vertical: 5,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            6,
                                                          ),
                                                      border: Border.all(
                                                        width: 1,
                                                        color: Color(
                                                          0xffD1D5DB,
                                                        ),
                                                      ),
                                                      color: whiteColor,
                                                    ),
                                                    child: Text(
                                                      "Edit",
                                                      style: style12,
                                                    ),
                                                  ),

                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Image.asset(
                                                      "$iconsAssets/delete.png",
                                                      scale: 3,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
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
      ),
    );
  }
}
