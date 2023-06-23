import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/all_images.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/features/moreScreen/dummy_data.dart';
import 'package:news_task_app/features/moreScreen/presentation/widgets/follow_us.dart';
import 'package:news_task_app/features/moreScreen/presentation/widgets/menu_item.dart';
import 'package:news_task_app/features/moreScreen/presentation/widgets/switch_language.dart';



class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( 

      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:45.getHeight(),),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE.getWidth()),
                  child: Image.asset(AllImages.logo,width: 85.getWidth(),fit: BoxFit.fill),
                ),
                SizedBox(height: 45.getHeight(),),

                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                  return MenuItemBuilder(menuItems: menuItems[index],);
                },),

                FollowUsBuilder(socialMediaModel: socialMedia,),
                const SwitchLanguage()

              ],
            ),
          ),
        ),
      ),
    );
  }
}
