import 'package:flutter/material.dart';
import 'package:insighta/bottom_navigation_bar.dart';
import 'package:insighta/core/routing/routes.dart';
import 'package:insighta/features/home/ui/home_screen.dart';
import 'package:insighta/features/login/ui/login_screen.dart';
import 'package:insighta/features/onboarding/ui/onboarding.dart';
import 'package:insighta/features/report/ui/report_card_details_screen.dart';
import 'package:insighta/features/report/ui/report_screen.dart';
import 'package:insighta/features/suggest/ui/suggest_screen.dart';
import 'package:insighta/features/therapy/ui/select_time_slots_screen.dart';
import 'package:insighta/features/therapy/ui/booking_success_screen.dart';
import 'package:insighta/features/therapy/ui/therapy_screen.dart';

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
      case Routes.reportScreen:
        return MaterialPageRoute(builder: (_) => const ReportScreen());
      case Routes.therapyScreen:
        return MaterialPageRoute(builder: (_) => const TherapyScreen());
      case Routes.reportCardDetailsScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
            builder: (_) => ReportCardDetailsScreen(arguments: args));
      case Routes.selectTimeSlotsScreen:
        return MaterialPageRoute(builder: (_) => const SelectTimeSlotsScreen());
      case Routes.bookingSuccessScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => BookingSuccessScreen(
                  date: args['date'] as DateTime,
                  time: args['time'] as String,
                ));
      case Routes.suggestScreen:
        return MaterialPageRoute(builder: (_) => const SuggestScreen());
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
