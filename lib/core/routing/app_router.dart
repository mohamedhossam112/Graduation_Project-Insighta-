import 'package:flutter/material.dart';
import 'package:insighta/bottom_navigation_bar.dart';
import 'package:insighta/core/routing/routes.dart';
import 'package:insighta/features/home/ui/home_screen.dart';
import 'package:insighta/features/login/ui/login_screen.dart';
import 'package:insighta/features/onboarding/ui/onboarding.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const Onboarding());
      case Routes.logInScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.navBarScreen:
        return MaterialPageRoute(builder: (_) => const navBar());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        // If no route matches, show an error screen
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
