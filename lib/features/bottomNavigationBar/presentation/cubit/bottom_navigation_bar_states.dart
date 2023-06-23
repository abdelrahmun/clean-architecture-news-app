
import 'package:news_task_app/core/enums/bottom_navigation_bar.dart';
import 'package:equatable/equatable.dart';

class BottomNavStates extends Equatable {
  final BottomNavItems navbarItem;
  final int index;

  const BottomNavStates(this.navbarItem, this.index);

  @override
  List<Object> get props => [navbarItem, index];
}