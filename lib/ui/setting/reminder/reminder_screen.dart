// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';
import 'package:lightweaver/ui/setting/setting_view_model.dart';
import 'package:provider/provider.dart';

class ReminderScreen extends StatelessWidget {
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
                                children: [
                                  Text(
                                    'Reminder Settings',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Configure how and when you receive reminders.',
                                    style: TextStyle(
                                      color: lightGreyColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  _buildCard(
                                    title: 'Notification Channels',
                                    child: Column(
                                      children: [
                                        _buildCheckbox(
                                          'Email notifications',
                                          model.emailNotif,
                                          (val) => model.setEmailNotif(val!),
                                        ),

                                        _buildCheckbox(
                                          'Push notifications',
                                          model.pushNotif,
                                          (val) => model.setPushNotif(val!),
                                        ),

                                        _buildCheckbox(
                                          'SMS notifications',
                                          model.smsNotif,
                                          (val) => model.setSmsNotif(val!),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 20),
                                  _buildCard(
                                    title: 'Reminder Schedule',
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Default Reminder Time',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        _buildDropdown(
                                          value: model.reminderTime,
                                          items: model.timeOptions,
                                          onChanged: (val) {
                                            model.reminderTime = val!;
                                          },
                                        ),
                                        const SizedBox(height: 16),
                                        const Text(
                                          'Reminder Frequency',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        _buildDropdown(
                                          value: model.reminderFreq,
                                          items: model.freqOptions,
                                          onChanged:
                                              (val) =>
                                                  model.reminderFreq = val!,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  _buildCard(
                                    title: 'Custom Reminders',
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'No custom reminders configured',
                                          style: TextStyle(
                                            color: lightGreyColor,
                                          ),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.add,
                                            color: whiteColor,
                                          ),
                                          label: Text(
                                            'Add',
                                            style: style12.copyWith(
                                              color: whiteColor,
                                            ),
                                          ),

                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: primaryColor,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Save Changes'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryColor,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
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
      ),
    );
  }
}

Widget _buildCard({required String title, required Widget child}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: borderColor),
      color: Colors.grey[50],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        child,
      ],
    ),
  );
}

Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
  return CheckboxListTile(
    activeColor: blueColor,
    contentPadding: EdgeInsets.zero,
    title: Text(label),
    value: value,
    onChanged: onChanged,
    controlAffinity: ListTileControlAffinity.leading,
  );
}

Widget _buildDropdown({
  required String value,
  required List<String> items,
  required void Function(String?) onChanged,
}) {
  return DropdownButtonFormField<String>(
    dropdownColor: whiteColor,
    borderRadius: BorderRadius.circular(20),
    value: value,
    onChanged: onChanged,
    items:
        items
            .map((val) => DropdownMenuItem(value: val, child: Text(val)))
            .toList(),
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    ),
  );
}
