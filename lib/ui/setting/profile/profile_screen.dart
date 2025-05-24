// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';
import 'package:lightweaver/ui/setting/setting_view_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
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
                            margin: const EdgeInsets.only(top: 70, bottom: 50),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                                    "Profile Information",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Center(
                                    child: Stack(
                                      children: [
                                        const CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.grey,
                                          child: Icon(
                                            Icons.person,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 14,
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: Colors.blue,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Profile Photo",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "Update your profile picture",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  buildTextField(
                                    label: "First Name",
                                    hintText: "John",
                                  ),
                                  buildTextField(
                                    label: "Last Name",
                                    hintText: "Doe",
                                  ),
                                  buildTextField(
                                    label: "Email",
                                    hintText: "john.doe@example.com",
                                  ),
                                  buildTextField(
                                    label: "Phone Number",
                                    hintText: "+1 (555) 123-4567",
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    "Bio",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "Product manager with 5+ years of experience in SaaS companies.",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 30),
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

Widget buildTextField({required String label, required String hintText}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    ),
  );
}
