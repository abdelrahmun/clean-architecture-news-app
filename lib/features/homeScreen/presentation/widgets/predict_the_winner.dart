import 'package:flutter/cupertino.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/all_images.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/strings.dart';
import 'package:news_task_app/features/homeScreen/data/datasources/dummy/Upcoming_matches.dart';

import 'predict_the_winner_card.dart';

class PredictTheWinner extends StatelessWidget {
  const PredictTheWinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppColors.white,
      width: double.infinity,
      // height: 250.getHeight(),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth(),vertical: Dimensions.PADDING_SIZE_LARGE.getHeight()),
        child: Row(
          children: [
            Expanded(child: PredictTheWinnerCard(clubModel: elHelal,)),
            Expanded(child: PredictTheWinnerCard(clubModel: elHelal,)),
            Expanded(child: PredictTheWinnerCard(clubModel: elHelal,)),

          ],
        ),
      ),
    );
  }
}


