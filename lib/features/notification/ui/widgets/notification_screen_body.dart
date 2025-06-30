import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/features/notification/ui/widgets/notification_list_view_item.dart';

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 3,
        separatorBuilder: (context, index) {
          return Divider(
            height: 0.5.h,
            color: ColorsManager.primaryColor,
            thickness: 0.6,
          );
        },
        itemBuilder: (context, index) {
          return NotificationsListViewItem(
            message: getMessage(index),
            timeAgo: getTimeAgo(index),
          );
        },
      ),
    );
  }

  String getMessage(int index) {
    switch (index) {
      case 0:
        return 'You booked a therapy session.';
      case 1:
        return 'A report for your usage is out!';
      case 2:
        return 'Want to check any new recommendations?';

      default:
        return 'Notification message';
    }
  }

  String getTimeAgo(int index) {
    switch (index) {
      case 0:
        return '21 mins ago';
      case 1:
        return '40 mins ago';
      case 2:
        return '15 mins ago';
      default:
        return 'Just now';
    }
  }
}
