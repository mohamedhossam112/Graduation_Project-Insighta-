import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:insighta/bloc_observer.dart';
import 'package:insighta/core/di/dependency_injection.dart';
import 'package:insighta/core/helpers/shared_pref_helper.dart';

import 'package:insighta/core/routing/app_router.dart';

import 'package:insighta/insighta_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupGetIt();

  final prefs = await SharedPreferences.getInstance();
  final hasSeen = prefs.getBool('hasSeenOnboarding') ?? false;
  bool isLoggedIn = await SharedPrefHelper.getBool(SharedPrefKeys.isLoggedIn);
  bool isFirstTime = await SharedPrefHelper.getBool(
    SharedPrefKeys.isFirstTime,
    defaultValue: true,
  );
/*
  String initialRoute;

  if (isLoggedIn) {
    initialRoute = Routes.navBarScreen;
  } else {
    initialRoute = isFirstTime ? Routes.onBoardingScreen : Routes.logInScreen;
  }*/
  runApp(InsightaApp(
    appRouter: AppRouter(),
    isLoggedIn: isLoggedIn,
    hasSeenOnboarding: hasSeen,
    navigatorKey: navigatorKey,
  ));
}
