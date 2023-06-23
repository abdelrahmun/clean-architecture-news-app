
part of 'media_center_cubit.dart';


abstract class MediaCenterState extends Equatable {
  const MediaCenterState();

  @override
  List<Object> get props => [];
}

class MediaCenterInitState extends MediaCenterState {}
class MediaCenterInitial extends MediaCenterState {}

class MediaCenterIsLoading extends MediaCenterState {
  final List<NewsModel> oldNews;
  final bool isFirstFetch;

  const MediaCenterIsLoading( {required this.isFirstFetch,required this.oldNews});
  @override
  List<Object> get props => [oldNews,isFirstFetch];

}

class MediaCenterLoaded extends MediaCenterState {
  final List<NewsModel> newsModel;

   MediaCenterLoaded({required this.newsModel}){
  }

  @override
  List<Object> get props => [newsModel];
}

class MediaCenterError extends MediaCenterState {
  final String msg;

  const MediaCenterError({required this.msg});

  @override
  List<Object> get props => [msg];
}