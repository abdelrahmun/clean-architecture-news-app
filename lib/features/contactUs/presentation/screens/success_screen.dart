import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/all_icons.dart';
import 'package:news_task_app/core/utils/all_images.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:news_task_app/core/utils/strings.dart';
import 'package:news_task_app/shared/widgets/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactUsSuccessScreen extends StatelessWidget {
  const ContactUsSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: BaseAppBar(
        bgImage: AllImages.homeAppbarBg,
        imageAlignment: Alignment.bottomRight,
        bgColor: AppColors.primaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 35.getHeight()),
          child: Stack(
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.getWidth(),vertical: Dimensions.PADDING_SIZE_LARGE.getHeight()),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Icon(Icons.close,size: 25.getFontSize(),color: AppColors.white,),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  AllImages.logo,
                  fit: BoxFit.cover,
                  width: 80.getWidth(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(messageHadSendSuccessfully.tr(),style: tajawalBold.copyWith(fontSize: 24.getFontSize(),color: AppColors.primaryColor),),
          SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT.getHeight(),),
          Text(orderNumber.tr(args: ['50155']),style: tajawalMedium.copyWith(fontSize: 22.getFontSize(),color: AppColors.orderNumber),),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE.getHeight(),),
          SvgPicture.asset(AllIcons.success,width: 110.getWidth(),)
        ],
      )),
    );
  }
}
