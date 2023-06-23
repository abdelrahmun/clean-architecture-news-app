
class ContactUsResponseModel{

final  String status;
  final String id;

ContactUsResponseModel({required this.status, required this.id});

  factory ContactUsResponseModel.fromJson(Map<String,dynamic> json){
    return ContactUsResponseModel(status: json['status'], id: json['id']);
  }
}