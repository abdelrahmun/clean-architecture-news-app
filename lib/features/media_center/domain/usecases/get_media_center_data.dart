import 'package:dartz/dartz.dart';
import 'package:news_task_app/core/usecases/usecase.dart';
import 'package:news_task_app/features/media_center/data/models/news_model.dart';
import 'package:news_task_app/features/media_center/domain/repositories/media_center_repository.dart';
import '../../../../core/error/failures.dart';

class GetMediaCenterDataUseCase implements UseCase<List<NewsModel>, GetMediaCenterDataParams> {
  final MediaCenterRepository mediaCenterRepository;

  GetMediaCenterDataUseCase({required this.mediaCenterRepository});

  @override
  Future<Either<Failure, List<NewsModel>>> call(GetMediaCenterDataParams params) =>
      mediaCenterRepository.getMediaCenterData(page: params.page);
}

class GetMediaCenterDataParams extends Params{
  final int page;
  GetMediaCenterDataParams({required this.page});
}