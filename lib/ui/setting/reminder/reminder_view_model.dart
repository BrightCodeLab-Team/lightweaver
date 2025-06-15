import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/core/others/base_view_model.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class ReminderViewModel extends BaseViewModel {
  // Example state (adjust based on your own model)
  bool emailNotif = false;
  bool pushNotif = true;
  bool smsNotif = false;

  String reminderTime = "8:00 AM";
  List<String> timeOptions = ["8:00 AM", "12:00 PM", "6:00 PM"];

  String reminderFreq = "Daily";
  List<String> freqOptions = ["Daily", "Weekly", "Monthly"];

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initializeTimezone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await tz.local.name;
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  void setEmailNotif(bool value) {
    emailNotif = value;
    notifyListeners();
  }

  void setPushNotif(bool value) {
    pushNotif = value;
    notifyListeners();
  }

  void setSmsNotif(bool value) {
    smsNotif = value;
    notifyListeners();
  }

  Future<void> saveAndScheduleReminders() async {
    try {
      setState(ViewState.busy);

      await initializeTimezone();

      final androidSettings = AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      );
      final settings = InitializationSettings(android: androidSettings);
      await _notificationsPlugin.initialize(settings);

      await _notificationsPlugin.zonedSchedule(
        0,
        'Reminder',
        'It’s time for your scheduled reminder!',
        _nextInstanceOfSelectedTime(),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'reminder_channel',
            'Reminders',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        matchDateTimeComponents:
            reminderFreq == "Daily"
                ? DateTimeComponents.time
                : (reminderFreq == "Weekly"
                    ? DateTimeComponents.dayOfWeekAndTime
                    : null),
        androidScheduleMode: AndroidScheduleMode.exact,
      );
    } catch (e) {
      // Optionally handle errors here
      debugPrint("Reminder scheduling error: $e");
    } finally {
      setState(ViewState.idle);
    }
  }

  Future<void> testReminder() async {
    try {
      setState(ViewState.busy);
      await initializeTimezone();

      await _notificationsPlugin.zonedSchedule(
        999, // Unique ID for test
        'Test Reminder',
        'This is a test notification!',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'reminder_channel',
            'Reminders',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exact,
        // uiLocalNotificationDateInterpretation:
        //     UILocalNotificationDateInterpretation.absoluteTime,
      );
      Get.snackbar("Success", "Test notification will appear in 5 seconds.");
    } catch (e) {
      debugPrint("Test Reminder Error: $e");
      Get.snackbar("Error", "Failed to send test notification.");
    } finally {
      setState(ViewState.idle);
    }
  }

  tz.TZDateTime _nextInstanceOfSelectedTime() {
    final now = tz.TZDateTime.now(tz.local);

    final parts = reminderTime.split(' ');
    final timeParts = parts[0].split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);
    final isPM = parts[1].toUpperCase() == 'PM';

    if (isPM && hour != 12) hour += 12;
    if (!isPM && hour == 12) hour = 0;

    tz.TZDateTime scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(Duration(days: 1));
    }

    return scheduledTime;
  }
}
