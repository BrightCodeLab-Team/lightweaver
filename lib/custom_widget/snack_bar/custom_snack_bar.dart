import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/colors.dart';

void customSnackbar({
  required String title,
  required String message,
  Color backgroundColor = primaryColor,
  Color textColor = whiteColor,
  // Color iconColor = whiteColor,
  // IconData icon = Icons.check_circle,
  SnackPosition position = SnackPosition.TOP,
  Duration duration = const Duration(seconds: 2),
}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundColor,
    colorText: textColor,
    // icon: Icon(icon, color: iconColor),
    snackPosition: position,
    duration: duration,
    margin: const EdgeInsets.all(10),
    borderRadius: 10,
  );
}
