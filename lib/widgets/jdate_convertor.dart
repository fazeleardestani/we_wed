import 'package:shamsi_date/shamsi_date.dart';

// ignore: non_constant_identifier_names
JDateConvertor(String jalaliDateString) {
  List jalaliDateList = jalaliDateString.split("-");

  Jalali jalaliDate = Jalali(int.parse(jalaliDateList[0]),
      int.parse(jalaliDateList[1]), int.parse(jalaliDateList[2]));
  Gregorian gregorian = jalaliDate.toGregorian();
  DateTime gregorianDate = gregorian.toDateTime();
  return gregorianDate;
}
