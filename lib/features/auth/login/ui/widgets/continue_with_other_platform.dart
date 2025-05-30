import 'package:flutter/material.dart';
import 'package:insighta/features/auth/login/ui/widgets/social_media_part.dart';

class ContinueWithOtherPlatform extends StatelessWidget {
  const ContinueWithOtherPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialMediaPart(iconImage: 'assets/svgs/facebook_icon.svg'),
        SocialMediaPart(iconImage: 'assets/svgs/google_icon.svg'),
        SocialMediaPart(iconImage: 'assets/svgs/apple_icon.svg')
      ],
    );
  }
}
