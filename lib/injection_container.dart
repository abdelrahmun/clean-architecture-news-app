import 'package:get_it/get_it.dart';
import 'package:news_task_app/core/api/api_consumer.dart';
import 'package:news_task_app/core/api/dio_consumer.dart';
import 'package:news_task_app/core/network/netwok_info.dart';
import 'package:news_task_app/features/bottomNavigationBar/presentation/cubit/bottom_navigation_bar_cubit.dart';
import 'package:news_task_app/features/contactUs/data/datasource/post_contact_us.dart';
import 'package:news_task_app/features/contactUs/data/model/user_data.dart';
import 'package:news_task_app/features/contactUs/data/repositories/post_contact_us_repository_impl.dart';
import 'package:news_task_app/features/contactUs/domain/repositories/contact_us_repo.dart';
import 'package:news_task_app/features/contactUs/domain/usecases/post_contact_us_data.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_cubit.dart';
import 'package:news_task_app/features/media_center/data/datasources/media_center_data_source.dart';
import 'package:news_task_app/features/media_center/data/repositories/media_center_repository_impl.dart';
import 'package:news_task_app/features/media_center/domain/repositories/media_center_repository.dart';
import 'package:news_task_app/features/media_center/domain/usecases/get_media_center_data.dart';
import 'package:news_task_app/features/media_center/presentation/cubit/media_center_cubit.dart';

final sl = GetIt.instance;

Future<void> initSl() async {


  sl.registerLazySingleton<UserData>(() => UserData());

  repository();
  useCases();
  bloc();
  dataSource();
}


void bloc() {
  sl.registerLazySingleton<BottomNavCubit>(() => BottomNavCubit());
  sl.registerLazySingleton<ContactUsCubit>(() => ContactUsCubit(postContactUsUseCase: sl<PostContactUsUseCase>()));
  sl.registerLazySingleton<MediaCenterCubit>(() => MediaCenterCubit(getMediaCenterDataUseCase: sl<GetMediaCenterDataUseCase>()));
}
void repository(){
  sl.registerLazySingleton<MediaCenterRepository>(() => MediaCenterRepositoryImpl(mediaCenterDataSource: sl<MediaCenterDataSource>(),));
  sl.registerLazySingleton<PostContactUsRepository>(() => PostContactUsRepositoryImpl(postContactUsDataSource: sl<PostContactUsDataSource>(),));

}
void dataSource(){
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer());
  sl.registerLazySingleton<MediaCenterDataSource>(() => MediaCenterDataSourceImpl(apiConsumer: sl<ApiConsumer>()));
  sl.registerLazySingleton<PostContactUsDataSource>(() => PostContactUsDataSourceImpl(apiConsumer: sl<ApiConsumer>()));
}

void useCases() {
  sl.registerLazySingleton<GetMediaCenterDataUseCase>(() => GetMediaCenterDataUseCase(mediaCenterRepository: sl<MediaCenterRepository>()));
  sl.registerLazySingleton<PostContactUsUseCase>(() => PostContactUsUseCase(postContactUsRepository: sl<PostContactUsRepository>()));

}