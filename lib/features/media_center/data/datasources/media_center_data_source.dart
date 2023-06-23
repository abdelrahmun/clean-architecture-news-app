
import 'package:news_task_app/core/api/api_constants.dart';
import 'package:news_task_app/core/api/api_consumer.dart';
import 'package:news_task_app/core/error/failures.dart';
import 'package:news_task_app/features/media_center/data/models/news_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
abstract class MediaCenterDataSource {
  Future<Either<Failure,List<NewsModel>>> getMediaCenter({required int page});
}

class MediaCenterDataSourceImpl implements MediaCenterDataSource{
  ApiConsumer apiConsumer;

  MediaCenterDataSourceImpl({required this.apiConsumer});
  @override
  Future<Either<Failure,List<NewsModel>>> getMediaCenter({required int page})async {

    try{

      final response = await apiConsumer.get(
          ApiConstants.baseUrl + ApiConstants.news,
          queryParameters: {
            "page":page,
            "limit":7
          }
      );

      return Right(List<NewsModel>.from(
          (response as List).map((e) => NewsModel.fromJson(e))));

    }on Failure catch(e){
      return Left(e);
    }on DioError catch(e){
      return Left(Failure(e.message));
    }catch (e){
      return Left(Failure(e.toString()));
    }

  }

}