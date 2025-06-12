// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:insighta/core/routing/app_router.dart';

import 'package:insighta/core/theming/colors.dart';

class InsightaApp extends StatelessWidget {
  const InsightaApp({
    Key? key,
    required this.appRouter,
    required this.hasSeenOnboarding,
    required this.navigatorKey,
  }) : super(key: key);
  final AppRouter appRouter;
  final bool hasSeenOnboarding;

  final GlobalKey<NavigatorState> navigatorKey;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(393, 852),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        theme: ThemeData(
            primaryColor: ColorsManager.primaryColor,
            scaffoldBackgroundColor: ColorsManager.white),
        debugShowCheckedModeBanner: false,
        initialRoute:
            //    hasSeenOnboarding ? Routes.logInScreen : Routes.onBoardingScreen,
            '/onBoardingScreen',
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
