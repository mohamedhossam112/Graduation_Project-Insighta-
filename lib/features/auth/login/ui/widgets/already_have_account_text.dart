import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:insighta/core/utils/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: Styles.textStyle14P.copyWith(color: Colors.black),
          ),
          TextSpan(
              text: ' Sign Up',
              style: Styles.textStyle16P.copyWith(fontWeight: FontWeight.w600),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, '/signUpScreen');
                }),
        ]));
  }
}
