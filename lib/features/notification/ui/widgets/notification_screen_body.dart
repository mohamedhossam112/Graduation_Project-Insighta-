import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/features/notification/ui/widgets/notification_list_view_item.dart';

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 3,
          thickness: 2,
          color: ColorsManager.primaryColor,
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: 3,
            separatorBuilder: (context, index) {
              return Divider(
                height: 0.5.h,
                color: ColorsManager.primaryColor,
                thickness: 0.5.w,
              );
            },
            itemBuilder: (context, index) {
              return NotificationsListViewItem(
                message: getMessage(index),
                timeAgo: getTimeAgo(index),
              );
            },
          ),
        ),
      ],
    );
  }

  String getMessage(int index) {
    switch (index) {
      case 0:
        return 'Check the details and confirm the delivery schedule.';
      case 1:
        return 'Your order #231667 has been dispatched and is on its way to the site.';
      case 2:
        return 'A login attempt was made from a new device. If this wasn’t you, update your security settings.';

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
