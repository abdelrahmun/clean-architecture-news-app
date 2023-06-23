import 'package:news_task_app/core/error/failures.dart';
import 'package:news_task_app/features/media_center/data/models/news_model.dart';
import 'package:dartz/dartz.dart';

abstract class MediaCenterRepository{

  Future<Either<Failure, List<NewsModel>>>  getMediaCenterData({required int page});

}