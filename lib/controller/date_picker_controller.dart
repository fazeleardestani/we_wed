import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class DatePickerController extends GetxController {
  RxString selectedDate = ''.obs;
  RxString rangeDuration = ''.obs;
  DateTime selectedDateTime = DateTime.now();

  pickDateWedding(context) async {
    Jalali? date = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1350),
      lastDate: Jalali(1450),
    );
    Gregorian gregorianDate = date!.toGregorian();
    selectedDateTime = gregorianDate.toDateTime();

    Duration range = JalaliRange(start: Jalali.now(), end: date).duration;
    rangeDuration.value =
        '${range.inDays.toString()} روز به مراسم عروسیت مونده و توی این ${range.inDays.toString()} روز کلی کار میشه کرد :)';
    selectedDate.value =
        '${date.formatter.yyyy}-${date.formatter.mm}-${date.formatter.dd}';
    }
}

// Future<void> scheduleNotification(selectedDate) async {
//   // Adjust this according to your notification plugin
//   final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   // Parse the selectedDate and set the notification at that time
//   // final scheduledDate = DateTime.parse(selectedDate);
//   log('sech date : ${selectedDate}');

//   // Check if the scheduledDate is in the future
//   if (selectedDate.isAfter(DateTime.now())) {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0, // Use a constant taskId or any unique integer value
//       'Task Reminder',
//       'Your task is due now!',
//       tz.TZDateTime.from(selectedDate, tz.getLocation('Asia/Tehran')),
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'we wed',
//           'we wed',
//           importance: Importance.high,
//           priority: Priority.high,
//         ),
//       ),
//       uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation
//           .absoluteTime, // Allow notification to be shown while the device is idle
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//     log('tz date : ${tz.TZDateTime.from(selectedDate, tz.getLocation('Asia/Tehran'))}');
//   }
// }
