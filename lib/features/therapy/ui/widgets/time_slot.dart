// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/therapy/logic/time_select_cubit/time_select_cubit.dart';

class TimeSlot extends StatelessWidget {
  const TimeSlot({
    super.key,
    required this.title,
    required this.slots,
  });
  final String title;
  final List<String> slots;
  @override
  Widget build(BuildContext context) {
    final selectedTime = context.select<TimeSelectCubit, String?>((cubit) {
      final state = cubit.state;
      if (state is TimeSelectLoaded) {
        return state.selectedTime;
      }
      return null;
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.textStyle20P
              .copyWith(fontWeight: FontWeight.w600, fontSize: 22.sp),
        ),
        SizedBox(
          height: 16.h,
        ),
        Wrap(
          spacing: 12.w,
          runSpacing: 18.h,
          children: slots.map((slot) {
            final isSelected = slot == selectedTime;

            return GestureDetector(
              onTap: () {
                context.read<TimeSelectCubit>().selectTime(slot);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: isSelected
                      ? ColorsManager.primaryColor
                      : Colors.transparent,
                  border: Border.all(
                    color: ColorsManager.primaryColor,
                  ),
                ),
                child: Text(slot,
                    style: Styles.textStyle14P.copyWith(
                        fontSize: 14.sp,
                        color: isSelected
                            ? Colors.white
                            : ColorsManager.darkGrey)),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
