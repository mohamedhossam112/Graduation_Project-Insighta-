// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/suggest/ui/widgets/suggest_card.dart';

class SuggestColumnListView extends StatelessWidget {
  const SuggestColumnListView({
    Key? key,
    required this.txt,
    required this.type,
  }) : super(key: key);
  final String txt;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: Styles.textStyle20I
              .copyWith(fontWeight: FontWeight.w800, color: Colors.black),
        ),
        SizedBox(
          height: 12.h,
        ),
        SizedBox(
          height: 160.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return SuggestCard(
                  imagePath: 'assets/images/${type}.png',
                );
              }),
        ),
        SizedBox(
          height: 16.h,
        )
      ],
    );
  }
}
