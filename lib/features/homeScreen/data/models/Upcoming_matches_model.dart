import 'package:news_task_app/features/homeScreen/data/models/club_model.dart';
import 'package:equatable/equatable.dart';

class UpcomingMatchesModel extends Equatable {
  final int id;
  final String dateTime;
  final ClubModel localTeam;
  final ClubModel visitorTeam;
  const UpcomingMatchesModel(
      {required this.id,
      required this.dateTime,
      required this.localTeam,
      required this.visitorTeam});

  factory UpcomingMatchesModel.fromJson(Map<String, dynamic> json) {
    return UpcomingMatchesModel(
        id: json['jd'],
        dateTime: json['date_time'],
        localTeam: json['local_team'],
        visitorTeam: json['visitor_team']);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [id, dateTime, localTeam, visitorTeam];
}
