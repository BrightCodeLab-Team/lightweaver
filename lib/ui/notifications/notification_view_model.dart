import 'package:flutter/material.dart';
import 'package:lightweaver/core/model/notification.dart';
import 'package:lightweaver/core/others/base_view_model.dart';

class NotificationViewModel extends BaseViewModel {
  final List<NotificationModel> notifications = [
    NotificationModel(
      icon: Icons.calendar_today,
      iconColor: Colors.blue,
      title: "New appointment with Sara Malik tomorrow at 3PM.",
      time: "2 minutes ago",
    ),
    NotificationModel(
      icon: Icons.local_shipping,
      iconColor: Colors.green,
      title: "Formula 'Immunity Boost' successfully sent to client.",
      time: "1 hour ago",
    ),
    NotificationModel(
      icon: Icons.settings,
      iconColor: Colors.black87,
      title: "App update available: Version 1.4 now supports dark mode.",
      time: "2 hours ago",
    ),
  ];
}
