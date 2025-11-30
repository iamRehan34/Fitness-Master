import 'package:fitness_pro/views/input_detail/Input_Details_Light.dart';
import 'package:fitness_pro/views/intro/intro_screen.dart';
import 'package:fitness_pro/views/splash/splash_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.intro, page: () => IntroScreen()),
    GetPage(
        name: AppRoutes.input_Details_Light, page: () => Input_Details_Light()),
    // GetPage(name: AppRoutes.quran, page: () => QuranScreen()),
    // GetPage(name: AppRoutes.surahDetails, page: () => SurahDetailsScreen()),
    // GetPage(name: AppRoutes.sebha, page: () => SebhaScreen()),
    // GetPage(name: AppRoutes.radio, page: () => RadioScreen()),
    // GetPage(name: AppRoutes.time, page: () => TimeScreen()),
    // GetPage(name: AppRoutes.hadith, page: () => HadithScreen()),
  ];
}
