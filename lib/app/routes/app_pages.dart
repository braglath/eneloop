import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/bottom_navigation.dart';
import '../modules/land_survey/bindings/land_survey_binding.dart';
import '../modules/land_survey/views/land_survey_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const BottomNavigation(),
      binding: HomeBinding(),
      transition: Transition.circularReveal,
      curve: Curves.fastOutSlowIn,
      alignment: Alignment.center,
      transitionDuration: 600.milliseconds,
    ),
    GetPage(
        name: _Paths.DASHBOARD,
        page: () => const DashboardView(),
        binding: DashboardBinding(),
        curve: Curves.fastOutSlowIn,
        alignment: Alignment.center,
        transitionDuration: 400.milliseconds,
        transition: Transition.rightToLeft),
    GetPage(
        name: _Paths.LAND_SURVEY,
        page: () => const LandSurveyView(),
        binding: LandSurveyBinding(),
        curve: Curves.fastOutSlowIn,
        alignment: Alignment.center,
        transitionDuration: 400.milliseconds,
        transition: Transition.rightToLeft),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
      transition: Transition.fadeIn,
      curve: Curves.fastOutSlowIn,
      alignment: Alignment.center,
      transitionDuration: 400.milliseconds,
    ),
  ];
}
