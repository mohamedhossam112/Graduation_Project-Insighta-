import 'package:flutter/material.dart';
import 'package:insighta/features/therapy/ui/widgets/therapy_screen_body.dart';

class TherapyScreen extends StatelessWidget {
  const TherapyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(child: TherapyScreenBody()),
    );
  }
}
