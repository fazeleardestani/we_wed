import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:we_wed/services/notification_service.dart';

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

    if (date != null) {
      Duration range = JalaliRange(start: Jalali.now(), end: date).duration;
      rangeDuration.value =
          '${range.inDays.toString()} روز به مراسم عروسیت مونده و توی این ${range.inDays.toString()} روز کلی کار میشه کرد :)';
      selectedDate.value =
          '${date.formatter.yyyy}-${date.formatter.mm}-${date.formatter.dd}';
    }
  }

  

}
