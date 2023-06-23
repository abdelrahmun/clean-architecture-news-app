
import 'package:news_task_app/core/api/api_constants.dart';
import 'package:news_task_app/core/api/api_consumer.dart';
import 'package:news_task_app/core/error/failures.dart';
import 'package:news_task_app/features/contactUs/data/model/contact_us_response.dart';
import 'package:news_task_app/features/contactUs/data/model/user_data.dart';
import 'package:news_task_app/features/media_center/data/models/news_model.dart';
import 'package:news_task_app/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class PostContactUsDataSource {
  Future<Either<Failure,ContactUsResponseModel>> postData();
}

class PostContactUsDataSourceImpl implements PostContactUsDataSource{
  ApiConsumer apiConsumer;

  PostContactUsDataSourceImpl({required this.apiConsumer});
  @override
  Future<Either<Failure,ContactUsResponseModel>> postData()async {

    try{
      final response = await apiConsumer.post(
          ApiConstants.baseUrl + ApiConstants.contactUs,
          body: {
            "firstName": sl<UserData>().getFirstName,
            "lastName": sl<UserData>().getLastName,
            "email": sl<UserData>().getEmail,
            "mobile": sl<UserData>().getMobile,
            "messageTitle": sl<UserData>().getMessageTitle,
            "messageType": sl<UserData>().getMessageType,
            "messageDesc": sl<UserData>().getMessageDesc,
            "attachment":sl<UserData>().getAttachment
          });
      return Right(ContactUsResponseModel.fromJson(response));

    }on Failure catch(e){
      return Left(e);
    }on DioError catch(e){
      return Left(Failure(e.message));
    }catch (e){
      return Left(Failure(e.toString()));
    }


  }

}