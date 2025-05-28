import 'package:flutter/material.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';
import 'package:insighta/features/therapy/ui/widgets/therapy_screen_body.dart';

class TherapyScreen extends StatelessWidget {
  const TherapyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Best Therapy',
          style: Styles.textStyle24P,
        ),
      ),
      body: SafeArea(child: TherapyScreenBody()),
    );
  }
}
