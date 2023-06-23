import 'package:news_task_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class PostContactUsRepository {
  Future<Either<Failure,bool>> postData();
}