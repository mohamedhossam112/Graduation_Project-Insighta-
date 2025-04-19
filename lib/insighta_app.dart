import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:insighta/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/routing/routes.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/features/therapy/logic/appointment_cubit/appointment_cubit.dart';
import 'package:insighta/features/therapy/logic/date_select_cubit/date_select_cubit.dart';
import 'package:insighta/features/therapy/logic/time_select_cubit/time_select_cubit.dart';

class InsightaApp extends StatelessWidget {
  const InsightaApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(393, 852),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DateSelectCubit(),
          ),
          BlocProvider(
            create: (context) => TimeSelectCubit(),
          ),
          BlocProvider(
            create: (context) => AppointmentCubit(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
              primaryColor: ColorsManager.primaryColor,
              scaffoldBackgroundColor: ColorsManager.white),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.navBarScreen,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}
