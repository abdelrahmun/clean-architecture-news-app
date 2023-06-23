import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/features/moreScreen/data/model/social_media_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
class FollowUsBuilder extends StatelessWidget {
  const FollowUsBuilder({Key? key, required this.socialMediaModel}) : super(key: key);

  final List<SocialMediaModel> socialMediaModel;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.getHeight()),
        child: Container(
          height: 50.getHeight(),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount:socialMediaModel.length  ,
            itemBuilder: (context, index) => IconButton(
              icon: SvgPicture.asset(socialMediaModel[index].icon,width: 17.getWidth(),height:17.getWidth() ,),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
