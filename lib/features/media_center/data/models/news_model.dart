import 'package:equatable/equatable.dart';

class NewsModel extends Equatable {
  final String id;
  final String createdAt;
  final String titleAr;
  final String titleEn;
  final String contentAr;
  final String contentEn;
  final String image;

  const NewsModel(
      {required this.id,
      required this.createdAt,
      required this.image,
      required this.contentAr,
      required this.contentEn,
      required this.titleAr,
      required this.titleEn});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      createdAt: json['createdAt'],
      image: json['image'],
      titleAr: json['title_ar'],
      titleEn: json['title_en'],
      contentAr: json['content_ar'],
      contentEn: json['content_en'],
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [id,createdAt,contentEn,contentAr,titleEn,titleAr,image];
}
