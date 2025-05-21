import 'package:flutter/material.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/constants/colors.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/core/model/notification.dart';
import 'package:lightweaver/ui/notifications/notification_view_model.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationViewModel(),
      child: Consumer<NotificationViewModel>(
        builder:
            (context, model, child) => Scaffold(
              backgroundColor: whiteColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(AppAssets().notificationScreen, scale: 4),

                        Positioned(
                          bottom: 50,
                          left: 10,
                          child: Text(
                            'Notifications',
                            style: style25B.copyWith(color: primaryColor),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Mark All as Read',
                            style: style14B.copyWith(color: blueColor),
                          ),
                          SizedBox(width: 20),
                          Text('Clear All', style: style14B),
                        ],
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: model.notifications.length,
                      itemBuilder: (context, index) {
                        return NotificationCard(
                          notification: model.notifications[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      color: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(notification.icon, size: 28, color: notification.iconColor),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification.title, style: style16),
                  const SizedBox(height: 4),
                  Text(
                    notification.time,
                    style: style14.copyWith(color: lightGreyColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
