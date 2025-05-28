import 'package:flutter/material.dart';
import 'package:insighta/core/theming/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new,
          color: ColorsManager.primaryColor),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
