import 'package:flutter/material.dart';
import 'package:lightweaver/core/model/notification.dart';

class NotificationViewModel extends ChangeNotifier {
  List<NotificationModel> _notifications = [];

  List<NotificationModel> get notifications => _notifications;

  /// Load notifications based on type
  void loadNotifications(String notificationType) {
    if (notificationType == 'admin') {
      _notifications = [
        NotificationModel(
          title: 'Admin Alert',
          content: 'System maintenance scheduled.',
          time: '2 mins ago',
          notificationType: 'admin',
        ),
        NotificationModel(
          title: 'Admin Message',
          content: 'Please verify your profile.',
          time: '10 mins ago',
          notificationType: 'admin',
        ),
      ];
    } else if (notificationType == 'user') {
      _notifications = [
        NotificationModel(
          title: 'New Message',
          content: 'You received a new message.',
          time: '5 mins ago',
          notificationType: 'user',
        ),
        NotificationModel(
          title: 'Account Update',
          content: 'Your account settings were updated.',
          time: '12 mins ago',
          notificationType: 'user',
        ),
      ];
    } else if (notificationType == 'offer') {
      _notifications = [
        NotificationModel(
          title: 'Special Offer!',
          content: 'Get 30% off on your next purchase.',
          time: '15 mins ago',
          notificationType: 'offer',
        ),
      ];
    } else {
      _notifications = [
        NotificationModel(
          title: 'Welcome!',
          content: 'Thanks for joining us!',
          time: 'Just now',
          notificationType: 'general',
        ),
      ];
    }

    notifyListeners();
  }

  // /// Mark all as read (if needed in future)
  // void markAllAsRead() {
  //   // Future: Add read-flag if necessary
  //   notifyListeners();
  // }

  /// Clear all notifications
  void clearAll() {
    _notifications.clear();
    notifyListeners();
  }
}
