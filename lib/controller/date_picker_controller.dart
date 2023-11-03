import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class DatePickerController extends GetxController {
  RxString selectedDate = ''.obs;

  pickDate(context) async {
    Jalali? date = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(), 
      firstDate: Jalali(1350),
      lastDate: Jalali(1450),
    );
    
    if(date != null) {
      selectedDate.value = '${date.formatter.yyyy}/${date.formatter.mm}/${date.formatter.dd}'; 
    }
  }
}

