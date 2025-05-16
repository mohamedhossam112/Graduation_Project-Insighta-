import 'package:flutter/material.dart';
import 'package:insighta/features/usage/ui/widgets/usage_screen_body.dart';

class UsageScreen extends StatelessWidget {
  const UsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(child: UsageScreenBody()),
    );
  }
}
