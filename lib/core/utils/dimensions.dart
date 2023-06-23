import 'package:flutter/material.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';

class Dimensions{
  static double fontSizeExtraSmall = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width>= 1300 ? 14.getFontSize() : 10.getFontSize();
  static double fontSizeSmall = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width >= 1300 ? 16.getFontSize() : 12.getFontSize();
  static double fontSizeDefault = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width >= 1300 ? 18.getFontSize() : 14.getFontSize();
  static double fontSizeLarge = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width >= 1300 ? 20.getFontSize() : 16.getFontSize();
  static double fontSizeExtraLarge = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width >= 1300 ? 22.getFontSize() : 18.getFontSize();
  static double fontSizeOverLarge = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width >= 1300 ? 28.getFontSize() : 24.getFontSize();

  static const double PADDING_SIZE_EXTRA_SMALL = 5.0;
  static const double PADDING_SIZE_SMALL = 10.0;
  static const double PADDING_SIZE_DEFAULT = 15.0;
  static const double PADDING_SIZE_LARGE = 20.0;
  static const double PADDING_SIZE_EXTRA_LARGE = 25.0;

  static const double RADIUS_SMALL = 5.0;
  static const double RADIUS_DEFAULT = 10.0;
  static const double RADIUS_LARGE = 15.0;
  static const double RADIUS_EXTRA_LARGE = 20.0;

  static const int MESSAGE_INPUT_LENGTH = 250;
}