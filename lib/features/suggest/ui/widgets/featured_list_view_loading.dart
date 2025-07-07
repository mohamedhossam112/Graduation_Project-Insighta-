import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:insighta/features/suggest/ui/widgets/custom_book_image_loading.dart';
import 'package:insighta/features/suggest/ui/widgets/custom_fading_widget.dart';

class FeaturedListViewLoading extends StatelessWidget {
  const FeaturedListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: CustomFadingWidget(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CustomBookImageLoading());
            }),
      ),
    );
  }
}
