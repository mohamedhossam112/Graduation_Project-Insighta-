import 'package:flutter/material.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';
import 'package:insighta/features/report/ui/report_screen_body.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(child: ReportScreenBody()),
    );
  }
}
