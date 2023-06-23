import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:easy_localization/easy_localization.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key, required this.onTap, required this.title, this.isLoading=false})
      : super(key: key);

  final VoidCallback onTap;
  final bool isLoading;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_LARGE.getWidth()),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: AppColors.primaryColor,borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT)),
          child: isLoading? const CircularProgressIndicator() : Text(
            title.tr(),
            style: tajawalMedium.copyWith(
                fontSize: 25.getFontSize(), color: AppColors.white,height: 0),
          ),
        ),
      ),
    );
  }
}
