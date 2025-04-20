import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/features/suggest/ui/widgets/suggest_column_list_view.dart';

class SuggestScreenBody extends StatelessWidget {
  const SuggestScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 28.sp),
      child: Column(
        children: [
          SuggestColumnListView(
            txt: 'Videos',
            type: 'video',
          ),
          SuggestColumnListView(
            txt: 'Articles',
            type: 'article',
          ),
          SuggestColumnListView(
            txt: 'Books',
            type: 'book',
          )
        ],
      ),
    );
  }
}
