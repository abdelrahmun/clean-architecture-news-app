import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:news_task_app/features/moreScreen/data/model/menu_items_model.dart';

class MenuItemBuilder extends StatelessWidget {
  const MenuItemBuilder({
    Key? key,
    required this.menuItems,
  }) : super(key: key);

  final MenuItemsModel menuItems;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, menuItems.route,);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.PADDING_SIZE_SMALL.getHeight()),
        child: SizedBox(
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              border: BorderDirectional(
                start: BorderSide(color: menuItems.color, width: 2),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.getHeight(),
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth()),
              child: Text(
                menuItems.title.tr(),
                style: tajawalMedium.copyWith(
                    fontSize: 23.getFontSize(), color: AppColors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
