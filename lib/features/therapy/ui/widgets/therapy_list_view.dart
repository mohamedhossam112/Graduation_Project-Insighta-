import 'package:flutter/material.dart';
import 'package:insighta/features/therapy/ui/widgets/therapy_card.dart';

class TherapyListView extends StatelessWidget {
  const TherapyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return TherapyCard();
        });
  }
}
