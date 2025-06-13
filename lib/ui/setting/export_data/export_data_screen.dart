import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';

class ExportDataScreen extends StatefulWidget {
  const ExportDataScreen({super.key});

  @override
  State<ExportDataScreen> createState() => _ExportDataScreenState();
}

class _ExportDataScreenState extends State<ExportDataScreen> {
  String? _selectedFormat = 'CSV';
  final Map<String, bool> _dataOptions = {
    'Profile Information': true,
    'Activity History': true,
    'Documents': true,
    'Settings': true,
  };

  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      barrierColor: transparentColor,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),

      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),

      ///
      /// Start Body
      ///
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(color: blackColor.withOpacity(0.59)),
          child: Stack(
            children: [
              Image.asset(AppAssets().setting2Screen),
              Positioned(
                top: 30,
                left: 16,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back, color: primaryColor, size: 30),
                ),
              ),
              Positioned(
                top: 30,
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
              Center(
                child: Container(
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
                    child: Column(
                      children: [
                        const Text(
                          'Export your data in different formats.',
                          style: TextStyle(fontSize: 16, color: lightGreyColor),
                        ),
                        const SizedBox(height: 20),
                        _buildSection(
                          title: 'Select Format',
                          child: Column(
                            children: [
                              _buildExportOption(
                                'CSV',
                                Icons.file_copy,
                                Colors.blue.shade100,
                              ),
                              const SizedBox(height: 12),
                              _buildExportOption(
                                'PDF',
                                Icons.picture_as_pdf,
                                Colors.red.shade100,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildSection(
                          title: 'Data Selection',
                          child: Column(
                            children:
                                _dataOptions.keys.map((key) {
                                  return CheckboxListTile(
                                    value: _dataOptions[key],
                                    onChanged: (val) {
                                      setState(() {
                                        _dataOptions[key] = val!;
                                      });
                                    },
                                    title: Text(key),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    activeColor: Colors.blue,
                                  );
                                }).toList(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildSection(
                          title: 'Date Range',
                          child: Column(
                            children: [
                              _buildDateField(
                                'Start Date',
                                _startDate,
                                () => _selectDate(context, true),
                              ),
                              const SizedBox(height: 12),
                              _buildDateField(
                                'End Date',
                                _endDate,
                                () => _selectDate(context, false),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.download, color: whiteColor),
                            label: Text(
                              'Export Data',
                              style: style14.copyWith(color: whiteColor),
                            ),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
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
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: style16),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildExportOption(String format, IconData icon, Color bgColor) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFormat = format;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color:
              _selectedFormat == format
                  ? bgColor.withOpacity(0.3)
                  : Colors.transparent,
          border: Border.all(color: lightGreyColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: bgColor,
              child: Icon(icon, color: Colors.black),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$format Export',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'Export data as ${format.toUpperCase()} ${format == 'CSV' ? 'file' : 'document'}',
                  style: const TextStyle(color: lightGreyColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField(String label, DateTime? date, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: onTap,

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: lightGreyColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date != null
                      ? DateFormat('MM/dd/yyyy').format(date)
                      : 'mm/dd/yyyy',
                  style: TextStyle(
                    color: date != null ? Colors.black : lightGreyColor,
                  ),
                ),
                const Icon(Icons.calendar_today, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
