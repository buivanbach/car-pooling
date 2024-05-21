// import 'package:intl/intl.dart';
// import 'package:logger/logger.dart';
//
// import '../values/app_configs.dart';
//
// class DateUtilsFormat {
//   static DateTime? fromString(String date, {String? format}) {
//     return DateTimeExtension.fromString(date, format: format);
//   }
//
//   static String toDateString(DateTime? dateTime, {String format = AppConfigs.dateDisplayFormat}) {
//     try {
//       return DateFormat(format).format(dateTime!.toLocal());
//     } catch (e) {
//       return '';
//     }
//   }
//
//   static String toDateTimeString(DateTime dateTime, {String format = AppConfigs.dateTimeDisplayFormat}) {
//     try {
//       return DateFormat(format).format(dateTime.toLocal());
//     } catch (e) {
//       return '';
//     }
//   }
//
//   static String toDateAPIString(DateTime dateTime, {String format = AppConfigs.dateAPIFormat}) {
//     try {
//       return DateFormat(format).format(dateTime);
//     } catch (e) {
//       return '';
//     }
//   }
//
//   static String toDateTimeAPIString(DateTime dateTime, {String format = AppConfigs.dateTimeAPIFormat}) {
//     try {
//       return dateTime.toIso8601String();
//     } catch (e) {
//       return '';
//     }
//   }
//
//   static DateTime startOfDay(DateTime dateTime) {
//     return DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0);
//   }
//
//   static DateTime endOfDay(DateTime dateTime) {
//     return DateTime(dateTime.year, dateTime.month, dateTime.day, 23, 59, 59);
//   }
//
//   static String monthFormat(int dateTime) {
//     String monthFormat = "";
//     if (dateTime == 1) {
//       monthFormat = "Tháng 1 - January";
//     } else if (dateTime == 2) {
//       monthFormat = "Tháng 2 - February";
//     } else if (dateTime == 3) {
//       monthFormat = "Tháng 3 - March";
//     } else if (dateTime == 4) {
//       monthFormat = "Tháng 4 - April";
//     } else if (dateTime == 5) {
//       monthFormat = "Tháng 5 - May";
//     } else if (dateTime == 6) {
//       monthFormat = "Tháng 6 - June";
//     } else if (dateTime == 7) {
//       monthFormat = "Tháng 7 - July";
//     } else if (dateTime == 8) {
//       monthFormat = "Tháng 8 - August";
//     } else if (dateTime == 9) {
//       monthFormat = "Tháng 9 - September";
//     } else if (dateTime == 10) {
//       monthFormat = "Tháng 10 - October";
//     } else if (dateTime == 11) {
//       monthFormat = "Tháng 11 - November";
//     } else {
//       monthFormat = "Tháng 12 - December";
//     }
//     return monthFormat;
//   }
//
//   static String monthFormat1(int dateTime) {
//     String monthFormat = "";
//     if (dateTime == 1) {
//       monthFormat = "Tháng Giêng";
//     } else if (dateTime == 2) {
//       monthFormat = "Tháng Hai";
//     } else if (dateTime == 3) {
//       monthFormat = "Tháng Ba";
//     } else if (dateTime == 4) {
//       monthFormat = "Tháng Tư";
//     } else if (dateTime == 5) {
//       monthFormat = "Tháng Năm";
//     } else if (dateTime == 6) {
//       monthFormat = "Tháng Sáu";
//     } else if (dateTime == 7) {
//       monthFormat = "Tháng Bảy";
//     } else if (dateTime == 8) {
//       monthFormat = "Tháng Tám";
//     } else if (dateTime == 9) {
//       monthFormat = "Tháng Chín";
//     } else if (dateTime == 10) {
//       monthFormat = "Tháng Mười";
//     } else if (dateTime == 11) {
//       monthFormat = "Tháng Mười Một";
//     } else {
//       monthFormat = "Tháng Chạp";
//     }
//     return monthFormat;
//   }
//
//   static String dayOfWeekFormat(int dayOfWeek) {
//     String dayOfWeekFormat = "";
//     if (dayOfWeek == 1) {
//       dayOfWeekFormat = "Thứ Hai - Monday";
//     } else if (dayOfWeek == 2) {
//       dayOfWeekFormat = "Thứ Ba - Tuesday";
//     } else if (dayOfWeek == 3) {
//       dayOfWeekFormat = "Thứ Tư - Wednesday";
//     } else if (dayOfWeek == 4) {
//       dayOfWeekFormat = "Thứ Năm - Thursday";
//     } else if (dayOfWeek == 5) {
//       dayOfWeekFormat = "Thứ Sáu - Friday";
//     } else if (dayOfWeek == 6) {
//       dayOfWeekFormat = "Thứ Bảy - Saturday";
//     } else {
//       dayOfWeekFormat = "Chủ Nhật - Sunday";
//     }
//     return dayOfWeekFormat;
//   }
//
//   static String dayOfWeekFormat1(int dayOfWeek) {
//     String dayOfWeekFormat = "";
//     if (dayOfWeek == 1) {
//       dayOfWeekFormat = "Thứ Hai - Monday";
//     } else if (dayOfWeek == 2) {
//       dayOfWeekFormat = "Thứ Ba - Tuesday";
//     } else if (dayOfWeek == 3) {
//       dayOfWeekFormat = "Thứ Tư - Wednesday";
//     } else if (dayOfWeek == 4) {
//       dayOfWeekFormat = "Thứ Năm - Thursday";
//     } else if (dayOfWeek == 5) {
//       dayOfWeekFormat = "Thứ Sáu - Friday";
//     } else if (dayOfWeek == 6) {
//       dayOfWeekFormat = "Thứ Bảy - Saturday";
//     } else {
//       dayOfWeekFormat = "Chủ Nhật - Sunday";
//     }
//     return dayOfWeekFormat;
//   }
// }
//
// ///Method
// extension DateTimeExtension on DateTime {
//   bool get isWeekend {
//     if (weekday == DateTime.saturday || weekday == DateTime.sunday) {
//       return true;
//     }
//     return false;
//   }
//
//   static DateTime? fromString(String date, {String? format}) {
//     if ((format ?? "").isNotEmpty) {
//       try {
//         return DateFormat(format).parse(date);
//       } catch (e) {
//         Logger().e(e);
//       }
//     }
//     try {
//       return DateTime.parse(date);
//     } catch (e) {
//       Logger().e(e);
//     }
//     //
//     try {
//       return DateFormat("yyyy/MM/dd").parse(date);
//     } catch (e) {
//       Logger().e(e);
//     }
//     return null;
//   }
//
//   String toDateString({String format = AppConfigs.dateDisplayFormat}) {
//     try {
//       return DateFormat(format).format(this);
//     } catch (e) {
//       return '';
//     }
//   }
//
//   String toDateTimeString({String format = AppConfigs.dateTimeDisplayFormat}) {
//     try {
//       return DateFormat(format).format(toLocal());
//     } catch (e) {
//       return '';
//     }
//   }
//
//   String toDateAPIString({String format = AppConfigs.dateAPIFormat}) {
//     try {
//       return DateFormat(format).format(this);
//     } catch (e) {
//       return '';
//     }
//   }
//
//   String toDateAPIString1({String format = 'yyyy-MM-dd'}) {
//     try {
//       return DateFormat(format).format(this);
//     } catch (e) {
//       return '';
//     }
//   }
//
//   String toDateTimeAPIString({String format = AppConfigs.dateTimeAPIFormat}) {
//     try {
//       return toIso8601String();
//     } catch (e) {
//       return '';
//     }
//   }
// }
