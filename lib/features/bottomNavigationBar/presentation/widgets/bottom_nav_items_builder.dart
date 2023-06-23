import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';

BottomNavigationBarItem bottomNavigationBarItemBuilder({required String iconPath,required String label}){


  print('ffa $label');
  return BottomNavigationBarItem(
    icon: Center(
      child: Padding(
        padding:  EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL.getHeight(),top: Dimensions.PADDING_SIZE_SMALL.getHeight(),),
        child: SvgPicture.asset(iconPath,width:25.getFontSize(),color: AppColors.grey,height: 22.getHeight(),fit: BoxFit.cover),
      ),
    ),
    label: label.tr(),

    activeIcon: Center(
      child: Padding(
        padding:  EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL.getHeight(),top: Dimensions.PADDING_SIZE_SMALL.getHeight(),),
        child: SvgPicture.asset(iconPath,width: 25.getFontSize(),color: AppColors.white,height: 22.getHeight(),fit: BoxFit.cover),
      ),
    ),
  );
}

