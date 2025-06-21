// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/model/notification.dart';
import 'package:lightweaver/ui/notifications/notification_screen.dart';

class NotificationsService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  late AndroidNotificationChannel channel;

  NotificationsService() {
    initConfigure();
  }

  Future<void> initConfigure() async {
    try {
      print("🔔 Initializing NotificationsService...");

      // 🔐 Request permissions (required on iOS)
      NotificationSettings settings = await _fcm.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      print("🔐 Permission granted: ${settings.authorizationStatus}");

      // 📲 Get FCM token
      String? fcmToken = await _fcm.getToken();
      print("📲 FCM Token: $fcmToken");

      // 📦 Create Android notification channel
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description: 'Used for important notifications.',
        importance: Importance.high,
      );

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(channel);

      // 🛠️ Initialize local notifications
      const initializationSettingsAndroid = AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      );

      const initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
      );

      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (response) {
          // Optional: handle tap
          print("🔔 Notification tapped: ${response.payload}");
        },
      );

      // 📩 Foreground message listener
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print("📩 Foreground message received: ${message.notification?.title}");

        if (message.notification != null) {
          _showLocalNotification(message);
        }

        if (message.data.isNotEmpty) {
          _handleNotification(message, isOnMessage: true);
        }
      });

      // 🕐 When notification is tapped in background or from terminated state
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print("📩 Notification opened: ${message.data}");

        if (message.data.isNotEmpty) {
          _handleNotification(message, isOnMessage: false);
        }
      });

      print("✅ NotificationsService Initialized.");
    } catch (e, s) {
      print("❌ Error initializing notifications: $e");
      print(s);
    }
  }

  /// Show notification using flutter_local_notifications
  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      await flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
        payload: notification.body,
      );
    }
  }

  /// Handles notification logic when received or tapped
  void _handleNotification(RemoteMessage message, {required bool isOnMessage}) {
    try {
      final notification = NotificationModel.fromDirectJson(message.data);

      if (isOnMessage) {
        // Show a snack bar in foreground
        Get.snackbar(
          notification.title ?? 'New Notification',
          notification.content ?? '',
          backgroundColor: whiteColor,
          onTap: (snack) => _navigateToNotificationScreen(notification),
        );
      } else {
        _navigateToNotificationScreen(notification);
      }
    } catch (e) {
      print("❌ Error handling notification: $e");
    }
  }

  /// Navigate to screen based on notification type
  void _navigateToNotificationScreen(NotificationModel notification) {
    Get.to(
      () => NotificationScreen(
        notificationType: notification.notificationType ?? "default",
      ),
    );
  }
}
