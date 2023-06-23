import 'package:flutter/cupertino.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:news_task_app/features/homeScreen/data/models/tweets_model.dart';
import 'package:easy_localization/easy_localization.dart';

class LatestTweets extends StatelessWidget {
  const LatestTweets({Key? key, required this.tweetsModel}) : super(key: key);
  final TweetsModel tweetsModel;
  @override
  Widget build(BuildContext context) {
    String tweetBody = context.locale.languageCode == 'ar'
        ? tweetsModel.arTweetBody
        : tweetsModel.enTweetBody;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth(),
              vertical: Dimensions.PADDING_SIZE_EXTRA_LARGE.getHeight()),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    tweetsModel.accountLogo,
                    width: 70.getWidth(),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tweetsModel.accountName,
                        style: tajawalBold.copyWith(
                            fontSize: 21.getFontSize(), color: AppColors.black),
                      ),
                      SizedBox(
                        height: Dimensions.PADDING_SIZE_EXTRA_SMALL.getHeight(),
                      ),
                      Text(
                        "@${tweetsModel.userName}",
                        style: tajawalRegular.copyWith(
                            fontSize: 18.getFontSize(),
                            color: AppColors.lightGrey),

                      ),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT.getHeight(),
              ),
              Text(
                tweetBody,
                style: tajawalRegular.copyWith(
                    fontSize: 14, color: AppColors.black),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
