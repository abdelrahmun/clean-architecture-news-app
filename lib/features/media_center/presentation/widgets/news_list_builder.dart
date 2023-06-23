import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/dimensions.dart';
import 'package:news_task_app/features/media_center/data/models/news_model.dart';
import 'package:news_task_app/features/media_center/presentation/cubit/media_center_cubit.dart';
import 'package:news_task_app/features/media_center/presentation/widgets/news_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewsListBuilder extends StatelessWidget {
   NewsListBuilder({Key? key, required this.news, required this.loadingMore}) : super(key: key);
  final scrollController = ScrollController();
  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {

        if (scrollController.position.pixels > 70) {
          BlocProvider.of<MediaCenterCubit>(context).getMediaCenterData();
        }
      }
    });
  }
  final List<NewsModel> news;
  final bool loadingMore;
  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      child: Column(
        children: [
          ListView.builder(
            primary: false,
            itemCount: news.length,
            shrinkWrap: true,

            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:Dimensions.PADDING_SIZE_DEFAULT.getWidth() ),
                    child: NewsCard(newsModel: news[index]),
                  ),

                ],
              );
            },
          ),

          loadingMore?const SizedBox(width:40,child: CircularProgressIndicator()):const SizedBox()

        ],
      ),
    );
  }
}
