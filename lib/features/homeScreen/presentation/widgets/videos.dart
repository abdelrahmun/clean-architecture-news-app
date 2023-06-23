import 'package:flutter/cupertino.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/all_images.dart';
import 'package:news_task_app/core/utils/dimensions.dart';

class Videos extends StatelessWidget {
  const Videos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: double.infinity,
      height: 300.getHeight(),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.RADIUS_LARGE.getWidth(),vertical: Dimensions.PADDING_SIZE_EXTRA_LARGE.getHeight()),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AllImages.videoPlaceholder,fit: BoxFit.fill,),
            Image.asset(AllImages.videoStart,fit: BoxFit.contain,width: 80.getWidth(),),
          ],
        ),
      ),
    );
  }
}
