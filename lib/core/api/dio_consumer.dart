import 'dart:convert';
import 'dart:io';
import 'package:news_task_app/core/api/api_consumer.dart';
import 'package:dio/dio.dart';
import 'package:news_task_app/core/error/exceptions.dart';
import 'package:news_task_app/core/error/failures.dart';
import 'status_code.dart';

class DioConsumer implements ApiConsumer {
  late Dio dio;

  DioConsumer() {
    dio = Dio(BaseOptions(
        connectTimeout: 30 * 1000,
        receiveTimeout: 30 * 1000,
        headers: {
          'accept': '*/*',
        }));
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }on SocketException catch(e){
      throw const Failure('No Internet connection');
    } on HttpException {
      throw const Failure("Couldn't find the post ");
    } on FormatException {
      throw const Failure("Bad response format ");
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.post(path,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body);

      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }on SocketException catch(e){
      throw const Failure('No Internet connection');
    } on HttpException {
      throw const Failure("Couldn't find the post ");
    } on FormatException {
      throw const Failure("Bad response format ");
    }


  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.put(path, queryParameters: queryParameters, data: body);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }on SocketException catch(e){
      throw const Failure('No Internet connection');
    } on HttpException {
      throw const Failure("Couldn't find the post ");
    } on FormatException {
      throw const Failure("Bad response format ");
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {

    // final responseJson = jsonDecode(response.data.toString());

    return response.data;
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.confilct:
            throw const ConflictException();
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}
