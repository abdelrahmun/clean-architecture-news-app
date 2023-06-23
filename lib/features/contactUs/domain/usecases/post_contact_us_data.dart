import 'package:dartz/dartz.dart';
import 'package:news_task_app/core/usecases/usecase.dart';
import 'package:news_task_app/features/contactUs/domain/repositories/contact_us_repo.dart';
import 'package:news_task_app/features/media_center/data/models/news_model.dart';
import 'package:news_task_app/features/media_center/domain/repositories/media_center_repository.dart';
import '../../../../core/error/failures.dart';

class PostContactUsUseCase implements UseCase<bool, NoParams> {
  final PostContactUsRepository postContactUsRepository;

  PostContactUsUseCase({required this.postContactUsRepository});

  @override
  Future<Either<Failure,bool>> call(NoParams noParams) {
    return postContactUsRepository.postData();
  }
}
