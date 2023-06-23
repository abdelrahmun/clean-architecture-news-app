

// Linkedin : www.linkedin.com/in/abdelrahmun


import 'package:flutter/material.dart';
import 'package:news_task_app/bloc_observer.dart';
import 'package:news_task_app/configs/routes/app_routes.dart';
import 'package:news_task_app/configs/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_task_app/features/bottomNavigationBar/presentation/screen/bottom_navigation_bar.dart';
import 'package:news_task_app/features/homeScreen/presentation/screen/home_screen.dart';
import 'package:news_task_app/injection_container.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Bloc.observer = MyBlocObserver();

  initSl();
runApp(EasyLocalization(
  supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
  path: 'assets/langs', // <-- change the path of the translation files
  fallbackLocale: const Locale('ar', 'EG'),
  useOnlyLangCode: true,
  startLocale: const Locale('ar','EG'),
  child: const MyApp(),

));

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(411.50, 876.75),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: appTheme(context),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
