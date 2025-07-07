import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/suggest/ui/widgets/featured_list_view.dart';

class SuggestScreenBody extends StatelessWidget {
  const SuggestScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Books & Articles',
                  style: Styles.textStyle20P,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              FeaturedBooksListView(),
            ],
          ),
        ),
      ],
    );
  }
}
