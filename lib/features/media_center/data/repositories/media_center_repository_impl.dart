import 'package:news_task_app/core/error/exceptions.dart';
import 'package:news_task_app/core/error/failures.dart';
import 'package:news_task_app/features/media_center/data/datasources/media_center_data_source.dart';
import 'package:news_task_app/features/media_center/data/models/news_model.dart';
import 'package:dartz/dartz.dart';
import 'package:news_task_app/features/media_center/domain/repositories/media_center_repository.dart';

class MediaCenterRepositoryImpl implements MediaCenterRepository {
  final MediaCenterDataSource mediaCenterDataSource;

  MediaCenterRepositoryImpl({required this.mediaCenterDataSource});
  @override
  Future<Either<Failure, List<NewsModel>>> getMediaCenterData(
      {required int page}) async {
    final news = await mediaCenterDataSource.getMediaCenter(page: page);

    return news.fold(
        (error) => Left(Failure(error.message)), (response) => Right(response));
  }
}
