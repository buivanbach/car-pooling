import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatNumberDot(String? number) {
  if (number == null || number.isEmpty) {
    return '';
  }
  try {
    if (number.contains('.')) {
      final double doubleValue = double.parse(number);
      final formatter = NumberFormat('#,###,###'); // Định dạng số thập phân
      return formatter.format(doubleValue);
    } else {
      final int intValue = int.parse(number);
      final formatter = NumberFormat('#,###,###');
      return formatter.format(intValue).replaceAll(',', '.');
    }
  } on Exception {
    return '';
  }
}

String formatNumberCommas(String? numberString) {
  if (numberString == null || numberString.isEmpty) {
    return '';
  }
  try {
    // Parse the string into a double
    final number = double.tryParse(numberString) ?? 0.0;

    // Create a NumberFormat object to format the number as currency
    final formatter = NumberFormat('#,###', 'en_US');

    // Use the formatter to format the number
    return formatter.format(number);
  } on Exception {
    return '';
  }
}


String formatNumberCommasVietnamese(String? numberString) {
  if (numberString == null || numberString.isEmpty) {
    return '';
  }
  try {
    // Parse the string into a double
    final number = double.tryParse(numberString) ?? 0.0;

    // Create a NumberFormat object to format the number as currency
    final formatter = NumberFormat('#,###', 'en_US');

    // Use the formatter to format the number
    return formatter.format(number);
  } on Exception {
    return '';
  }
}

String formatDateTimeExportOrder(DateTime? dateTime) {
  try {
    if(dateTime == null) return '--';
    final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
    return formatter.format(dateTime);
  } on Exception {
    return '';
  }
}

String formatDateTimeExportOrderLocal(DateTime? dateTime, BuildContext context) {
  try {
    if(dateTime == null) return '--';

    final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm:ss', Localizations.localeOf(context).languageCode);
    return formatter.format(dateTime);
  } catch (e) {
    return '';
  }
}
