import 'package:flutter/material.dart';
import 'package:news_task_app/configs/routes/app_routes.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/all_images.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:news_task_app/features/homeScreen/data/datasources/dummy/Upcoming_matches.dart';
import 'package:news_task_app/features/homeScreen/data/datasources/dummy/dummy_tweets.dart';
import 'package:news_task_app/features/homeScreen/presentation/widgets/Upcoming_matches.dart';
import 'package:news_task_app/features/homeScreen/presentation/widgets/home_scetion.dart';
import 'package:news_task_app/features/homeScreen/presentation/widgets/latest_tweets.dart';
import 'package:news_task_app/features/homeScreen/presentation/widgets/news_home_card_builder.dart';
import 'package:news_task_app/features/homeScreen/presentation/widgets/partners.dart';
import 'package:news_task_app/features/homeScreen/presentation/widgets/predict_the_winner.dart';
import 'package:news_task_app/features/homeScreen/presentation/widgets/videos.dart';
import 'package:news_task_app/shared/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // App Bar In Background
          Opacity(
            opacity: 0.3,
            child: BaseAppBar(
              bgImage: AllImages.homeAppbarBg,
              imageAlignment: Alignment.bottomRight,
              bgColor: AppColors.primaryColor,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical:
                    Dimensions.PADDING_SIZE_EXTRA_LARGE.getHeight()),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    AllImages.logo,
                    fit: BoxFit.cover,
                    width: 70.getWidth(),
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            primary: true,
            child: Column(
              children: [
                BaseAppBar(
                  bgImage: AllImages.homeAppbarBg,
                  imageAlignment: Alignment.bottomRight,
                  bgColor: AppColors.primaryColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical:
                            Dimensions.PADDING_SIZE_EXTRA_LARGE.getHeight()),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        AllImages.logo,
                        fit: BoxFit.cover,
                        width: 70.getWidth(),
                      ),
                    ),
                  ),
                ),
                HomeSection(
                  title: latestNews,
                  showMore: true,
                  body: const NewsHomeCardBuilder(),
                  onTapShowMore: () {
                    Navigator.pushNamed(context, Routes.mediaCenter);
                  },
                ),
                HomeSection(
                  title: upcomingMatches,
                  showMore: true,
                  body: Column(
                    children: List.generate(
                        upcomingMatchesDummy.length,
                        (index) => UpcomingMatches(
                              upcomingMatchesModel: upcomingMatchesDummy[index],
                            )),
                  ),
                  onTapShowMore: () {},
                ),
                HomeSection(
                  title: latestTweets,
                  showMore: true,
                  body: Column(
                    children: List.generate(
                        DummyTweets.tweets.length,
                        (index) => LatestTweets(
                            tweetsModel: DummyTweets.tweets[index])),
                  ),
                  onTapShowMore: () {},
                ),
                const HomeSection(
                  title: predictTheWinner,
                  showMore: false,
                  body: PredictTheWinner(),
                ),
                const HomeSection(
                  title: videos,
                  showMore: false,
                  body: Videos(),
                ),
                const HomeSection(
                  title: partners,
                  showMore: false,
                  body: Partners(),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
