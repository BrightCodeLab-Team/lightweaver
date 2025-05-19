import 'package:flutter/material.dart';
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
            (context, model, child) =>
                Scaffold(body: Center(child: Text('Notifications'))),
      ),
    );
  }
}
