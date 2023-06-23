import 'package:news_task_app/core/enums/bottom_navigation_bar.dart';
import 'package:news_task_app/features/bottomNavigationBar/presentation/cubit/bottom_navigation_bar_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<BottomNavStates> {
  BottomNavCubit()
      : super(const BottomNavStates(BottomNavItems.home, 0));

  void getBottomNavItem(BottomNavItems bottomNavigationItems) {
    switch (bottomNavigationItems) {
      case BottomNavItems.home:
        emit(const BottomNavStates(BottomNavItems.home, 0));
        break;
      case BottomNavItems.leagueTable:
        emit(const BottomNavStates(BottomNavItems.leagueTable, 1));
        break;
      case BottomNavItems.mediaCenter:
        emit(const BottomNavStates(BottomNavItems.mediaCenter, 2));
        break;
      case BottomNavItems.statistics:
        emit(const BottomNavStates(BottomNavItems.statistics, 3));
        break;
      case BottomNavItems.more:
        emit(const BottomNavStates(BottomNavItems.more, 4));
        break;
      default:
        emit(const BottomNavStates(BottomNavItems.home, 0));
    }
  }
}
