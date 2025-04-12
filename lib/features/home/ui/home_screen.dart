import 'package:flutter/material.dart';
import 'package:insighta/core/theming/colors.dart';

import 'package:insighta/features/home/ui/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.white,
        body: SafeArea(
          child: HomeScreenBody(),
        ));
  }
}
