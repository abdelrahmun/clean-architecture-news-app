import 'package:flutter/material.dart';
import 'package:news_task_app/configs/routes/app_routes.dart';
import 'package:news_task_app/core/enums/bottom_navigation_bar.dart';
import 'package:news_task_app/core/usecases/usecase.dart';
import 'package:news_task_app/core/utils/all_icons.dart';
import 'package:news_task_app/features/bottomNavigationBar/presentation/cubit/bottom_navigation_bar_cubit.dart';
import 'package:news_task_app/features/bottomNavigationBar/presentation/cubit/bottom_navigation_bar_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_task_app/features/bottomNavigationBar/presentation/widgets/bottom_nav_items_builder.dart';
import 'package:news_task_app/features/dummyScreen.dart';
import 'package:news_task_app/features/homeScreen/presentation/screen/home_screen.dart';
import 'package:news_task_app/features/media_center/domain/usecases/get_media_center_data.dart';
import 'package:news_task_app/features/media_center/presentation/cubit/media_center_cubit.dart';
import 'package:news_task_app/features/media_center/presentation/screen/media_center.dart';
import 'package:news_task_app/features/moreScreen/presentation/screens/more_screen.dart';
import 'package:news_task_app/injection_container.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNavStates>(
        builder: (context, state) => BottomNavigationBar(
          currentIndex: state.index,
          onTap: (index) => onTap(context,index: index),
          showUnselectedLabels: true,
          items: [
            bottomNavigationBarItemBuilder(
                iconPath: AllIcons.home, label: BottomNavItems.home.name),
            bottomNavigationBarItemBuilder(
                iconPath: AllIcons.leagueTable,
                label: BottomNavItems.leagueTable.name),
            bottomNavigationBarItemBuilder(
                iconPath: AllIcons.mediaCenter,
                label: BottomNavItems.mediaCenter.name),
            bottomNavigationBarItemBuilder(
                iconPath: AllIcons.statistics,
                label: BottomNavItems.statistics.name),
            bottomNavigationBarItemBuilder(
                iconPath: AllIcons.more, label: BottomNavItems.more.name),
          ],
        ),
      ),
      body: BlocBuilder<BottomNavCubit, BottomNavStates>(
          builder: (context, state) {
        if (state.navbarItem == BottomNavItems.home) {
          return const HomeScreen();
        } else if (state.navbarItem == BottomNavItems.leagueTable) {
          return const Dummy();
        } else if(state.navbarItem == BottomNavItems.more){
          return const MoreScreen();
        } else if (state.navbarItem == BottomNavItems.mediaCenter) {
          return BlocProvider<MediaCenterCubit>( 
            create:(context) => MediaCenterCubit(getMediaCenterDataUseCase: sl<GetMediaCenterDataUseCase>())..getMediaCenterData(),
            child:  const MediaCenterScreen(),
          );
        }
        return const Dummy();
      }),
    );
  }

  onTap(context,{required int index}){
    if (index == 0) {
      BlocProvider.of<BottomNavCubit>(context)
          .getBottomNavItem(BottomNavItems.home);
    } else if (index == 1) {
      BlocProvider.of<BottomNavCubit>(context)
          .getBottomNavItem(BottomNavItems.leagueTable);
    } else if (index == 2) {
      BlocProvider.of<BottomNavCubit>(context)
          .getBottomNavItem(BottomNavItems.mediaCenter);
    } else if (index == 3) {
      BlocProvider.of<BottomNavCubit>(context)
          .getBottomNavItem(BottomNavItems.statistics);
    } else if (index == 4) {
      BlocProvider.of<BottomNavCubit>(context)
          .getBottomNavItem(BottomNavItems.more);
    }

  }
}
