import 'package:flutter/material.dart';
import 'package:news_task_app/features/bottomNavigationBar/presentation/cubit/bottom_navigation_bar_cubit.dart';
import 'package:news_task_app/features/bottomNavigationBar/presentation/screen/bottom_navigation_bar.dart';
import 'package:news_task_app/features/contactUs/presentation/cubit/contact_us_cubit.dart';
import 'package:news_task_app/features/contactUs/presentation/screens/contact_us.dart';
import 'package:news_task_app/features/contactUs/presentation/screens/success_screen.dart';
import 'package:news_task_app/features/homeScreen/presentation/screen/home_screen.dart';
import 'package:news_task_app/features/media_center/presentation/cubit/media_center_cubit.dart';
import 'package:news_task_app/features/media_center/presentation/screen/media_center.dart';
import 'package:news_task_app/features/moreScreen/presentation/screens/more_screen.dart';
import 'package:news_task_app/features/newsDetails/presentation/screens/news_details.dart';
import 'package:news_task_app/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String initialRoute = '/';
  static const String homeScreen = '/homeScreen';
  static const String newsDetailsScreen = '/newsDetailsScreen';
  static const String moreScreen = '/moreScreen';
  static const String contactUs = '/contactUs';
  static const String mediaCenter = '/mediaCenter';
  static const String contactUsSuccessScreen = '/contactUsSuccessScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {

    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) {
          return MultiBlocProvider(providers: [
            BlocProvider<BottomNavCubit>(create: ((context) => sl<BottomNavCubit>()),),
            BlocProvider<MediaCenterCubit>(create: ((context) => sl<MediaCenterCubit>()..getMediaCenterData()),),
          ], child:  const BottomNavigationBarScreen());
        }));
      case Routes.homeScreen:
        return MaterialPageRoute(builder: ((context) {
          return const HomeScreen();
        }));
      case Routes.contactUsSuccessScreen:
        return MaterialPageRoute(builder: ((context) {
          return const ContactUsSuccessScreen();
        }));
      case Routes.newsDetailsScreen:
        return MaterialPageRoute(
            builder: (context) => NewsDetailsScreen(),
            settings: RouteSettings(arguments: args));
      case Routes.moreScreen:
        return MaterialPageRoute(
          builder: (context) => const MoreScreen(),
        );
      case Routes.contactUs:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<ContactUsCubit>.value(
              value: sl<ContactUsCubit>(),
              child: ContactUsScreen(),
            );
          },
        );
      case Routes.mediaCenter:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<MediaCenterCubit>.value(
              value: sl<MediaCenterCubit>(),
              child: const MediaCenterScreen(),
            );
          },
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text('Not Defined'),
              ),
            )));
  }
}
