import 'package:flutter/animation.dart';
import 'package:news_task_app/configs/routes/app_routes.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/utils/all_icons.dart';
import 'package:news_task_app/core/utils/strings.dart';
import 'package:news_task_app/features/moreScreen/data/model/menu_items_model.dart';
import 'package:news_task_app/features/moreScreen/data/model/social_media_model.dart';


List<MenuItemsModel> menuItems = [
  MenuItemsModel(title: clubsDirectory,color: AppColors.greyMenuColor,route: ''),
  MenuItemsModel(title: stadiumDirectory,color: AppColors.greyMenuColor,route: ''),
  MenuItemsModel(title: aboutUs,color: AppColors.redMenuColor,route: ''),
  MenuItemsModel(title: regulationsRegulations,color: AppColors.greenMenuColor,route: ''),
  MenuItemsModel(title: committees,color: AppColors.blueMenuColor,route: ''),
  MenuItemsModel(title: contactUs,color: AppColors.greyMenuColor,route:Routes.contactUs),
  MenuItemsModel(title: shareApp,color: AppColors.redMenuColor,route: ''),
  MenuItemsModel(title: subscribeToNewsletter,color: AppColors.greenMenuColor,route: ''),

];

// Social Media
List<SocialMediaModel> socialMedia=[

  SocialMediaModel(icon: AllIcons.facebook,link: ''),
  SocialMediaModel(icon: AllIcons.twitter,link: ''),
  SocialMediaModel(icon: AllIcons.linkedIn,link: ''),
  SocialMediaModel(icon: AllIcons.instagram,link: ''),
  SocialMediaModel(icon: AllIcons.youtube,link: ''),
];