import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/date_ext.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/extensions/strings_ext.dart';
import 'package:news_task_app/core/utils/all_images.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:news_task_app/features/media_center/data/models/news_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:news_task_app/features/newsDetails/presentation/widgets/news_details_app_bar.dart';
import 'package:news_task_app/shared/widgets/app_bar.dart';

class NewsDetailsScreen extends StatefulWidget {
  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  bool showAppBar = false;
  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final NewsModel newsModel = arguments['data'];

    String title = context.locale.languageCode == 'ar'
        ? newsModel.titleAr
        : newsModel.titleEn;
    String content = context.locale.languageCode == 'ar'
        ? newsModel.contentAr
        : newsModel.contentEn;

    // Handel Date
    DateTime dateTime = newsModel.createdAt.toDateTime();
    String day = dateTime.getDayNumber(context);
    String month = dateTime.getMonthName(context);
    String year = dateTime.getYear(context);

    return Scaffold(


      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewsDetailsAppBar(
              showAppBar: showAppBar,
              newsModel: newsModel,
            ),
            SizedBox(
              height: Dimensions.PADDING_SIZE_DEFAULT.getHeight(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth(),
              ),
              child: Text(
                title,
                style: tajawalBold.copyWith(fontSize: 22.getFontSize()),
              ),
            ),
            SizedBox(
              height: Dimensions.PADDING_SIZE_EXTRA_SMALL.getHeight(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth(),
              ),
              child: Text(
                'الدورى الرياضي',
                style: tajawalMedium.copyWith(
                    fontSize: 18.getFontSize(), color: AppColors.grey),
              ),
            ),
            SizedBox(
              height: Dimensions.PADDING_SIZE_EXTRA_SMALL.getHeight(),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth(),
                ),
                child: Text(
                  '$day $month $year',
                  style: tajawalMedium.copyWith(
                      fontSize: 14.getFontSize(), color: AppColors.grey),
                )),
            SizedBox(
              height: Dimensions.PADDING_SIZE_DEFAULT.getHeight(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth()),
              child: Text(
                content,
                style: tajawalMedium.copyWith(
                    fontSize: 17.getFontSize(), color: AppColors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
