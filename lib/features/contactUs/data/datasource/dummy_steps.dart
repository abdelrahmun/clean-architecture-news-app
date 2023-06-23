import 'package:news_task_app/core/utils/strings.dart';
import 'package:news_task_app/features/contactUs/data/model/steps_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:news_task_app/features/contactUs/presentation/widgets/data_step.dart';
import 'package:news_task_app/features/contactUs/presentation/widgets/information_step.dart';
List<StepsModel> contactUsSteps= [
  StepsModel(stepCount: 1,stepName:data,stepContent: DataStep()),
  StepsModel(stepCount: 2,stepName:information,stepContent:  const InformationStep())
];