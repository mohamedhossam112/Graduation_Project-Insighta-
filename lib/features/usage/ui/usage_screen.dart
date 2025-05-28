import 'package:flutter/material.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';
import 'package:insighta/features/usage/ui/widgets/usage_screen_body.dart';

class UsageScreen extends StatelessWidget {
  const UsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(child: UsageScreenBody()),
    );
  }
}
