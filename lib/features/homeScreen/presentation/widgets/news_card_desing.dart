import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_task_app/configs/routes/app_routes.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/date_ext.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/extensions/strings_ext.dart';
import 'package:news_task_app/core/utils/all_images.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:news_task_app/core/utils/image_builder.dart';
import 'package:news_task_app/features/media_center/data/models/news_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:news_task_app/features/media_center/presentation/widgets/custom_rectangle.dart';

class NewsCardDesign extends StatelessWidget {
  const NewsCardDesign({Key? key, required this.newsModel}) : super(key: key);
 final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    String title = context.locale.languageCode == 'ar'
        ? newsModel.titleAr
        : newsModel.titleEn;

    DateTime dateTime = newsModel.createdAt.toDateTime();
    String day = dateTime.getDayNumber(context);
    String month = dateTime.getMonthName(context);
    String year = dateTime.getYear(context);

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Routes.newsDetailsScreen,arguments: {
          'data':newsModel
        });
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_SMALL)),
                  width: MediaQuery.of(context).size.width,
                  height: 250.getHeight(),
                  child: Hero(
                    tag:newsModel.id,
                    child: ImageBuilder(
                        fit: BoxFit.cover, imageUrl: newsModel.image),
                  ),
                ),
                CustomPaint(
                  size: Size(
                      40.getWidth(),
                      (40.getWidth() * 0.7301194290707836)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: CustomRectangleShape(),

                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      AllImages.logo,
                      width: 40.getWidth(),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: Dimensions.PADDING_SIZE_DEFAULT.getHeight(),
            ),
            Text(
              'الدورى المصرى',
              style: tajawalMedium.copyWith(
                  fontSize: 17.getFontSize(), color: AppColors.grey),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical:
                  Dimensions.PADDING_SIZE_EXTRA_SMALL.getHeight()),
              child: Text(
                title,
                style: tajawalBold.copyWith(
                  fontSize: 17.getFontSize(),
                  color: AppColors.black,

                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: Dimensions.PADDING_SIZE_EXTRA_SMALL.getHeight(),
            ),
          ],
        ),
      ),
    );
  }
}
