import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/all_images.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/core/utils/fonts.dart';
import 'package:news_task_app/core/utils/strings.dart';
import 'package:news_task_app/features/media_center/presentation/cubit/media_center_cubit.dart';
import 'package:news_task_app/features/media_center/presentation/widgets/news_list_builder.dart';
import 'package:news_task_app/features/media_center/presentation/widgets/tab_bar.dart';
import 'package:news_task_app/shared/widgets/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:news_task_app/injection_container.dart';

class MediaCenterScreen extends StatefulWidget {
  const MediaCenterScreen({super.key});

  @override
  State<MediaCenterScreen> createState() => _MediaCenterScreenState();
}

class _MediaCenterScreenState extends State<MediaCenterScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: BaseAppBar(
          bgImage: AllImages.homeAppbarBg,
          imageAlignment: Alignment.bottomRight,
          bgColor: AppColors.primaryColor,
          bottom: MediaCenterTabBar(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 35.getHeight()),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AllImages.logo,
                fit: BoxFit.cover,
                width: 80.getWidth(),
              ),
            ),
          ),
        ),
        body: TabBarView(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          viewportFraction: 1,
          children: [
            BlocBuilder<MediaCenterCubit, MediaCenterState>(
              builder: (context, state) {
                if (state is MediaCenterIsLoading && state.isFirstFetch) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MediaCenterLoaded) {
                  // print('state.newsModelstate.newsModel ${state.newsModel.length}');
                  return NewsListBuilder(
                    news: state.newsModel,
                    loadingMore: false,
                  );
                } else if (state is MediaCenterIsLoading && state.isFirstFetch == false) {
                  return NewsListBuilder(
                    news: state.oldNews,
                    loadingMore: true,
                  );
                } else if (state is MediaCenterError) {
                  return Center(child: Text(state.msg,style: tajawalBold.copyWith(fontSize: 35.getFontSize()),),);
                }
                return const SizedBox();
              },
            ),
            const SizedBox(),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
