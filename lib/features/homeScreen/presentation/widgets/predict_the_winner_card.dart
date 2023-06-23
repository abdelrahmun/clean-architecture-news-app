import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:news_task_app/features/homeScreen/data/models/club_model.dart';
import 'package:easy_localization/easy_localization.dart';

class PredictTheWinnerCard extends StatelessWidget {
  const PredictTheWinnerCard({Key? key, required this.clubModel}) : super(key: key);

final ClubModel clubModel;
  @override
  Widget build(BuildContext context) {
    String clubName = context.locale.languageCode=='ar'?clubModel.arName:clubModel.enName;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.getWidth()),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
              border: Border.all(color: AppColors.border,width: 2)
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_LARGE.getHeight()),
              child: Image.asset(clubModel.logo,height: 50.getHeight(),),
            ),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT.getHeight(),),
          Text(clubName,style: tajawalBold.copyWith(fontSize: 19.getFontSize()),),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.getHeight(),),
          Text('50%',style: tajawalMedium.copyWith(fontSize: 17.getFontSize(),color: AppColors.grey),)
        ],
      ),
    );
  }
}
