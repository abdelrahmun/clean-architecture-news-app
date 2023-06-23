import 'package:flutter/cupertino.dart';

class StepsModel{
  final String stepName;
  final int stepCount;
  final Widget stepContent;
  StepsModel({required this.stepName,required this.stepCount,required this.stepContent});
}