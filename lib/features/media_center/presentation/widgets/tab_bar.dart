import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:news_task_app/core/utils/strings.dart';
import 'package:easy_localization/easy_localization.dart';


class MediaCenterTabBar extends StatelessWidget {
   MediaCenterTabBar({Key? key}) : super(key: key);

  final tabBatTextStyle = tajawalMedium.copyWith(
      fontSize: 20.getFontSize(), color: AppColors.white);

  @override
  Widget build(BuildContext context) {
    return  TabBar(
      indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(color: Colors.white, width: 4)),
      labelColor: AppColors.white,
      labelStyle: tabBatTextStyle,
      unselectedLabelColor: AppColors.unSelectedTab,
      unselectedLabelStyle: tabBatTextStyle,
      tabs: [
        Padding(
          padding: EdgeInsets.only(
              bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL.getHeight()),
          child: Text(news.tr()),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL.getHeight()),
          child: Text(photos.tr()),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL.getHeight()),
          child: Text(videos.tr()),
        ),
      ],
    );
  }
}
