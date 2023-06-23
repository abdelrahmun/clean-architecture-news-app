import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_task_app/features/homeScreen/presentation/widgets/news_card_desing.dart';
import 'package:news_task_app/features/media_center/presentation/cubit/media_center_cubit.dart';
class NewsHomeCardBuilder extends StatelessWidget {
  const NewsHomeCardBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCenterCubit,MediaCenterState>(
      builder: (context, state) {
        if(state is MediaCenterLoaded){
          return NewsCardDesign(newsModel: state.newsModel[0],);
        }else if(state is MediaCenterIsLoading){
          return const Center(child: CircularProgressIndicator(),);
        }else{
          return const SizedBox();
        }
      },
    );
  }
}
