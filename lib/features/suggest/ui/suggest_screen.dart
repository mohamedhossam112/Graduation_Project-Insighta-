import 'package:flutter/material.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/suggest/ui/widgets/suggest_screen_body.dart';

class SuggestScreen extends StatelessWidget {
  const SuggestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Recommended',
          style: Styles.textStyle24P,
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(child: SuggestScreenBody()),
    );
  }
}
