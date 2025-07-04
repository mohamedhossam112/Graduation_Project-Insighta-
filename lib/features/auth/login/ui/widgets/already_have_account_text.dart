// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:insighta/core/utils/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({
    super.key,
    required this.text1,
    required this.text2,
    required this.path,
  });
  final String text1;
  final String text2;
  final String path;
  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: text1,
            style: Styles.textStyle14P.copyWith(color: Colors.black),
          ),
          TextSpan(
              text: text2,
              style: Styles.textStyle16P.copyWith(fontWeight: FontWeight.w600),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, path);
                }),
        ]));
  }
}
