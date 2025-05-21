import 'package:flutter/material.dart';

class NotificationModel {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String time;

  NotificationModel({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.time,
  });
}
