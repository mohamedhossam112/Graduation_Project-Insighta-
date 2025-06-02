import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insighta/bottom_navigation_bar.dart';
import 'package:insighta/core/di/dependency_injection.dart';
import 'package:insighta/core/routing/routes.dart';
import 'package:insighta/features/auth/forget_password/ui/forget_password_screen.dart';
import 'package:insighta/features/auth/login/logic/login_cubit/login_cubit.dart';
import 'package:insighta/features/auth/login/ui/login_screen.dart';
import 'package:insighta/features/auth/otp/ui/otp_screen.dart';
import 'package:insighta/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:insighta/features/home/ui/home_screen.dart';

import 'package:insighta/features/notification/ui/notification_screen.dart';
import 'package:insighta/features/onboarding/ui/onBoarding_screen.dart';
import 'package:insighta/features/report/ui/report_card_details_screen.dart';
import 'package:insighta/features/report/ui/report_screen.dart';
import 'package:insighta/features/suggest/ui/suggest_screen.dart';
import 'package:insighta/features/therapy/ui/select_time_slots_screen.dart';
import 'package:insighta/features/therapy/ui/booking_success_screen.dart';
import 'package:insighta/features/therapy/ui/therapy_screen.dart';
import 'package:insighta/features/usage/ui/usage_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const onBoardingScreen());
      case Routes.logInScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: LoginScreen(),
                ));
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.otpScreen:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case Routes.navBarScreen:
        return MaterialPageRoute(builder: (_) => const navBar());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
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
      case Routes.usageScreen:
        return MaterialPageRoute(builder: (_) => const UsageScreen());
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
