import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/enums/bottom_navigation_bar.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:news_task_app/core/utils/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_task_app/features/bottomNavigationBar/presentation/cubit/bottom_navigation_bar_cubit.dart';
class SwitchLanguage extends StatelessWidget {
  const SwitchLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String langName = context.locale.languageCode == 'ar' ? english : arabic;
    return InkWell(
      highlightColor: Colors.transparent,

        onTap: () async{
          if (context.locale.languageCode == 'ar') {
           await context.setLocale(const Locale('en', 'US')).then((value) {
             BlocProvider.of<BottomNavCubit>(context).getBottomNavItem(BottomNavItems.home);
           });
          } else {
            await  context.setLocale(const Locale('ar', 'EG'),).then((value) {
              BlocProvider.of<BottomNavCubit>(context).getBottomNavItem(BottomNavItems.home);

            });
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.PADDING_SIZE_DEFAULT.getHeight()),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                langName.tr(),
                style: tajawalMedium.copyWith(
                    color: AppColors.white, fontSize: 20.getFontSize(),),
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.getWidth(),),
              Icon(Icons.g_translate_outlined, color: AppColors.white),
            ],
          ),
        ));
  }
}
