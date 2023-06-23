import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/date_ext.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/extensions/strings_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:news_task_app/features/homeScreen/data/models/Upcoming_matches_model.dart';
import 'package:news_task_app/features/homeScreen/data/models/club_model.dart';
import 'package:easy_localization/easy_localization.dart';

class UpcomingMatches extends StatelessWidget {
  UpcomingMatches({Key? key, required this.upcomingMatchesModel})
      : super(key: key);

  final UpcomingMatchesModel upcomingMatchesModel;

  final TextStyle clubNameStyle = tajawalBold.copyWith(
      fontSize: 16.getFontSize(), overflow: TextOverflow.ellipsis);

  final TextStyle dateTimeStyle = tajawalMedium.copyWith(
    overflow: TextOverflow.ellipsis,
  );
  @override
  Widget build(BuildContext context) {

    String visitorTeamName = context.locale.languageCode == 'ar'
        ? upcomingMatchesModel.visitorTeam.arName
        : upcomingMatchesModel.visitorTeam.enName;
    String localeTeamName = context.locale.languageCode == 'ar'
        ? upcomingMatchesModel.localTeam.arName
        : upcomingMatchesModel.localTeam.enName;

    DateTime dateTime = upcomingMatchesModel.dateTime.toDateTime();
    String dayName = dateTime.getDayName(context);
    String dayNumber = dateTime.getDayNumber(context);
    String monthName = dateTime.getMonthName(context);
    String time = dateTime.getTime(context);


    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth(),
              vertical: Dimensions.PADDING_SIZE_SMALL.getHeight()),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      upcomingMatchesModel.localTeam.logo,
                      width: 28.getWidth(),
                      height: 28.getWidth(),
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: Dimensions.PADDING_SIZE_SMALL.getWidth(),
                    ),
                    Flexible(
                      child: Text(
                        visitorTeamName,
                        style: clubNameStyle,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Dimensions.PADDING_SIZE_DEFAULT.getWidth(),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      time,
                      textAlign: TextAlign.center,
                      style: dateTimeStyle.copyWith(fontSize: 18.getFontSize()),
                    ),
                    FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          " $dayName $dayNumber $monthName",
                          textAlign: TextAlign.center,
                          style: dateTimeStyle.copyWith(
                              color: AppColors.grey,
                              fontSize: 16.getFontSize()),
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: Dimensions.PADDING_SIZE_DEFAULT.getWidth(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        localeTeamName,
                        style: clubNameStyle,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.PADDING_SIZE_SMALL.getWidth(),
                    ),
                    Image.asset(
                      upcomingMatchesModel.visitorTeam.logo,
                      width: 28.getWidth(),
                      height: 28.getWidth(),
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
