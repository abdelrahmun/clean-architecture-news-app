class ClubModel {
  final int id;
  final String arName;
  final String enName;
  final String logo;

  ClubModel({required this.id, required this.arName,required this.enName, required this.logo});
  factory ClubModel.fromJson({required Map<String, dynamic> json}) {
    return ClubModel(
        id: json['jd'],
        arName: json['club_name_ar'],
        enName: json['club_name_en'],
        logo: json['club_logo']);
  }
}
