import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String content; // ✅ Add this line
  final String time;
  final String notificationType;

  NotificationModel({
    required this.title,
    required this.content, // ✅ Add this line
    required this.time,
    required this.notificationType,
  });

  factory NotificationModel.fromDirectJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'] ?? '',
      content: json['content'] ?? '', // ✅ Add this line
      time: json['time'] ?? 'Just now',
      notificationType: json['notificationType'] ?? 'default',
    );
  }

  IconData get icon {
    switch (notificationType.toLowerCase()) {
      case 'admin':
        return Icons.admin_panel_settings;
      case 'system':
        return Icons.system_update;
      case 'user':
        return Icons.message;
      case 'offer':
        return Icons.local_offer;
      default:
        return Icons.notifications;
    }
  }

  Color get iconColor {
    switch (notificationType.toLowerCase()) {
      case 'admin':
        return Colors.blue;
      case 'system':
        return Colors.orange;
      case 'user':
        return Colors.green;
      case 'offer':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
