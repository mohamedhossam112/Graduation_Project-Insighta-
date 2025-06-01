import 'package:flutter/material.dart';
import 'package:insighta/core/di/dependency_injection.dart';
import 'package:insighta/core/routing/app_router.dart';
import 'package:insighta/insighta_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final hasSeen = prefs.getBool('hasSeenOnboarding') ?? false;

  runApp(InsightaApp(
    appRouter: AppRouter(),
    hasSeenOnboarding: hasSeen,
  ));
}
