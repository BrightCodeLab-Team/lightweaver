// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';
import 'package:lightweaver/ui/setting/setting_view_model.dart';
import 'package:provider/provider.dart';

class HelpAndSupportScreen extends StatelessWidget {
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
                                    'Help & Support',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Get help with using the application.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF5B5B79),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  _buildCard(
                                    icon: Icons.chat_bubble_outline,
                                    iconColor: Colors.blue.shade100,
                                    title: 'Contact Support',
                                    titleColor: primaryColor,
                                    subtitle:
                                        'Get help from our customer support team.',
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      width: double.infinity,
                                      height: 45,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: blueColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Open Support Ticket',
                                          style: style16.copyWith(
                                            color: whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  _buildCard(
                                    icon: Icons.menu_book_rounded,
                                    iconColor: Colors.purple.shade100,
                                    title: 'Documentation',
                                    titleColor: primaryColor,
                                    subtitle:
                                        'Browse our detailed documentation.',
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        'View Documentation',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF2B2B4D),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  _faqSection(),
                                  const SizedBox(height: 20),
                                  _resourcesSection(),
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

Widget _buildCard({
  required IconData icon,
  required Color iconColor,
  required String title,
  required Color titleColor,
  required String subtitle,
  Widget? child,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFFE5E7EB)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: iconColor,
              child: Icon(icon, color: const Color(0xFF4B4B6A), size: 18),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: titleColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 14, color: Color(0xFF5B5B79)),
        ),
        if (child != null) child,
      ],
    ),
  );
}

Widget _faqSection() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: _boxDecoration(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Frequently Asked Questions',
          style: TextStyle(
            fontSize: 16,
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16),
        _FaqItem(
          question: 'How do I reset my password?',
          answer:
              'You can reset your password by clicking on the \'Forgot Password\' link on the login page.',
        ),
        SizedBox(height: 16),
        _FaqItem(
          question: 'Can I export my data?',
          answer:
              'Yes, you can export your data in CSV or PDF format from the Export Data section.',
        ),
        SizedBox(height: 16),
        _FaqItem(
          question: 'How do I enable dark mode?',
          answer:
              'You can enable dark mode from the Appearance section in your settings.',
        ),
      ],
    ),
  );
}

Widget _resourcesSection() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: _boxDecoration(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Resources',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF2B2B4D),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        _resourceItem(Icons.menu_book, 'User Guide'),
        _resourceItem(Icons.forum_outlined, 'Community Forum'),
        _resourceItem(Icons.support_agent, 'Video Tutorials'),
      ],
    ),
  );
}

Widget _resourceItem(IconData icon, String title) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    decoration: BoxDecoration(
      color: const Color(0xFFF4F6FA),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Icon(icon, color: const Color(0xFF3478F6), size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 15, color: Color(0xFF2B2B4D)),
          ),
        ),
        const Icon(Icons.open_in_new, color: Color(0xFF9FA8C4), size: 18),
      ],
    ),
  );
}

BoxDecoration _boxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: const Color(0xFFE5E7EB)),
  );
}

class _FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const _FaqItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2B2B4D),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          answer,
          style: const TextStyle(fontSize: 14, color: Color(0xFF5B5B79)),
        ),
      ],
    );
  }
}
