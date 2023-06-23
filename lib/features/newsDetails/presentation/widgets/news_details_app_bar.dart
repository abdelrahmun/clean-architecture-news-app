import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/all_icons.dart';
import 'package:news_task_app/core/utils/all_images.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/image_builder.dart';
import 'package:news_task_app/features/media_center/data/models/news_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_task_app/shared/widgets/app_bar.dart';

class NewsDetailsAppBar extends StatelessWidget {
  const NewsDetailsAppBar({Key? key, required this.newsModel, required this.showAppBar}) : super(key: key);

  final NewsModel newsModel;
  final bool showAppBar;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 350.getHeight(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
              tag: newsModel.id,
              child: ImageBuilder(imageUrl: newsModel.image, fit: BoxFit.cover,)),
          Align(
            alignment: Alignment.topCenter,

            child: SafeArea(
              child: Container(
                width: double.infinity,
                height: 70.getHeight(),
                color: Colors.transparent,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios,color: AppColors.white,size:
                        35.getFontSize(),),
                      )
                      ,Icon(Icons.share,color: AppColors.white,size: 35.getFontSize(),)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
