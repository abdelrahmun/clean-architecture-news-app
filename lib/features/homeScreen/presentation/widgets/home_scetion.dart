import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:news_task_app/core/utils/strings.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeSection extends StatelessWidget {
  const HomeSection(
      {super.key,
      required this.body,
      required this.title,
      this.showMore = false, this.onTapShowMore,  this.bgColor = Colors.white})
      : assert(showMore == true ? onTapShowMore != null  : onTapShowMore== null);

  final String title;
  final Color bgColor;
  final bool showMore;
  final Widget body;
  final GestureTapCallback? onTapShowMore;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.PADDING_SIZE_LARGE.getHeight()),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth()),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title.tr(),
                  style: tajawalBold.copyWith(
                      fontSize: 20.getFontSize(), color: AppColors.black),
                ),
                Visibility(
                  visible: showMore,
                  child: InkWell(
                    onTap: onTapShowMore,
                    child: Text(
                      more.tr(),
                      style: tajawalBold.copyWith(
                          fontSize: 17.getFontSize(), color: AppColors.darkBlue),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
          // Section Body
          body
        ],
      ),
    );
  }
}
