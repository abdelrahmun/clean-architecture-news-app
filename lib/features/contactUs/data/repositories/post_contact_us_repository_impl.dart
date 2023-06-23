import 'package:news_task_app/core/error/exceptions.dart';
import 'package:news_task_app/core/error/failures.dart';
import 'package:news_task_app/core/network/netwok_info.dart';
import 'package:news_task_app/features/contactUs/data/datasource/post_contact_us.dart';
import 'package:news_task_app/features/contactUs/domain/repositories/contact_us_repo.dart';
import 'package:dartz/dartz.dart';

class PostContactUsRepositoryImpl implements PostContactUsRepository {
  // final NetworkInfo networkInfo;
  final PostContactUsDataSource postContactUsDataSource;

  PostContactUsRepositoryImpl({required this.postContactUsDataSource});
  @override
  Future<Either<Failure, bool>> postData() async {
    final response = await postContactUsDataSource.postData();

    return response.fold((error) => Left(Failure(error.message)), (response) {
      if (response.status == 'success') {
        return const Right(true);
      } else {
        return const Left(Failure('try again'));
      }
    });
  }
}
