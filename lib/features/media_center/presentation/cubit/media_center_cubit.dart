import 'package:news_task_app/core/error/failures.dart';
import 'package:news_task_app/core/usecases/usecase.dart';
import 'package:news_task_app/features/contactUs/domain/usecases/post_contact_us_data.dart';
import 'package:news_task_app/features/media_center/data/models/news_model.dart';
import 'package:news_task_app/features/media_center/domain/usecases/get_media_center_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'media_center_states.dart';

class MediaCenterCubit extends Cubit<MediaCenterState> {
  final GetMediaCenterDataUseCase getMediaCenterDataUseCase;
  MediaCenterCubit({required this.getMediaCenterDataUseCase})
      : super(MediaCenterInitState());

  int page = 1;
  bool latestPage = false;

  Future<void> getMediaCenterData() async {
    var oldNews = <NewsModel>[];

    // if (state is MediaCenterIsLoading) return;

    final currentState = state;

    if (currentState is MediaCenterLoaded) {
      oldNews = currentState.newsModel;
    }

    emit(MediaCenterIsLoading(oldNews: oldNews, isFirstFetch: page == 1));

    if (latestPage == false) {
      Either<Failure, List<NewsModel>> response =
          await getMediaCenterDataUseCase(GetMediaCenterDataParams(page: page));

      response.fold((failure) {

        emit(MediaCenterError(msg: failure.message));

      }, (newsResponse) {
        if (latestPage == false) {
          page++;
        }

        if (newsResponse.isEmpty) {
          latestPage = true;
        }
        oldNews.addAll(newsResponse);

        emit(MediaCenterLoaded(newsModel: oldNews));
      });
    } else {
      emit(MediaCenterLoaded(newsModel: oldNews));
    }
  }

  // String _mapFailureToMsg(Failure failure) {
  //   switch (failure.runtimeType) {
  //     case ServerFailure:
  //       return 'AppStrings.serverFailure';
  //     default:
  //       return 'AppStrings.unexpectedError';
  //   }
  // }
}
