import 'package:news_task_app/core/utils/all_images.dart';
import 'package:news_task_app/features/homeScreen/data/models/Upcoming_matches_model.dart';
import 'package:news_task_app/features/homeScreen/data/models/club_model.dart';


ClubModel elHelal = ClubModel(
  id: 1,
  logo: AllImages.El_helal,
  arName: 'الهلال',
  enName: 'El Helal'
);
ClubModel elAhly = ClubModel(
    id: 2,
    logo: AllImages.El_Ahly,
    arName: 'الهلال',
    enName: 'El Ahly'
);

ClubModel elEthad = ClubModel(
    id: 3,
    logo: AllImages.El_Thad,
    arName: 'الأتحاد',
    enName: 'El Ethad'
);

ClubModel elShapap = ClubModel(
    id: 4,
    logo: AllImages.El_Shapap,
    arName: 'الشباب',
    enName: 'El Shapap'
);

ClubModel elEtfaq = ClubModel(
    id: 5,
    logo: AllImages.El_Etfaq,
    arName: 'الأتفاق',
    enName: 'El Etfaq'
);
ClubModel elNasr = ClubModel(
    id: 6,
    logo: AllImages.El_Nasr,
    arName: 'النصر',
    enName: 'El Nasr'
);
List<UpcomingMatchesModel> upcomingMatchesDummy = [
  UpcomingMatchesModel(id: 1,visitorTeam: elHelal,localTeam: elAhly,dateTime: '2022-12-26T03:00:00',),
  UpcomingMatchesModel(id: 1,visitorTeam: elShapap,localTeam: elEthad,dateTime: '2022-12-27T05:30:00'),
  UpcomingMatchesModel(id: 1,visitorTeam: elNasr,localTeam: elEtfaq,dateTime: '2023-01-01T22:17:00'),

];