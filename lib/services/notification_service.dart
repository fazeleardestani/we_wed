import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  Future<void> initNotification() async {
    tz.initializeTimeZones(); // اینیشیالایز کردن داده‌های منطقه زمانی
    tz.setLocalLocation(
        tz.getLocation('Asia/Tehran')); // تنظیم منطقه زمانی پیش‌فرض

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<DateTime> convertJalaliToGregorian(String jalaliDate) async {
    List<String> parts = jalaliDate.split('-');
    int year = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int day = int.parse(parts[2]);

    DateTime gregorianDate =
        Jalali(year, month, day).toGregorian().toDateTime();
    return gregorianDate;
  }

  Future<void> showNotification(
      int id, String title, String body, String jalaliDate) async {
    DateTime scheduledDate = await convertJalaliToGregorian(jalaliDate);
    tz.TZDateTime tzScheduledDate = tz.TZDateTime.from(scheduledDate, tz.local);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tzScheduledDate,
      matchDateTimeComponents:
          DateTimeComponents.time, // این خط بسته به نیاز شما ممکن است تغییر کند
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'channelId',
          'channelName',
          channelDescription: 'channelDescription',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> updateNotification(
      int id, String title, String body, String jalaliDate) async {
    await cancelNotification(id);
    await showNotification(id, title, body, jalaliDate);
  }

  Future<void> showScheduledNotification(int id, String title, String body) async {
  tz.initializeTimeZones(); // اطمینان از اینکه این خط کد در بخش مناسبی از برنامه‌تان فراخوانی می‌شود، مثلاً در initState یا main

  var androidDetails = const AndroidNotificationDetails(
    'channelId',
    'channelName',
    channelDescription: 'channelDescription',
    importance: Importance.max,
    priority: Priority.high,
  );
  var platformDetails = NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    title,
    body,
    tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)), // زمان‌بندی نوتیفیکیشن برای 10 ثانیه بعد
    platformDetails,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // اجازه نمایش نوتیفیکیشن حتی در حالت idle
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
  );
}
}
