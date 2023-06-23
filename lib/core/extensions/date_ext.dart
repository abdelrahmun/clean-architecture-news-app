import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';

extension DateExtension on DateTime{
  String getDayName(BuildContext context) {
    var format = DateFormat.EEEE(context.locale.languageCode);
    var dateString = format.format(this);
    return dateString;
  }
  String getMonthName(BuildContext context) {
    var format = DateFormat.MMMM(context.locale.languageCode);
    var dateString = format.format(this);
    return dateString;
  }
  String getDayNumber(BuildContext context) {
    var format = DateFormat.d('en');
    var dateString = format.format(this);
    return dateString;
  }
  String getYear(BuildContext context) {
    var format = DateFormat.y('en');
    var dateString = format.format(this);
    return dateString;
  }
  String getTime(BuildContext context) {
    var format = DateFormat.Hm('en');
    var dateString = format.format(this);
    return dateString;
  }
}