import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/therapy/logic/date_select_cubit/date_select_cubit.dart';
import 'package:intl/intl.dart';

class DateSelectListView extends StatelessWidget {
  const DateSelectListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateSelectCubit, DateSelectState>(
      builder: (context, state) {
        if (state is DateSelectLoaded) {
          return ListView.separated(
            separatorBuilder: (_, __) => SizedBox(
              width: 20.w,
            ),
            itemCount: state.dates.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final date = state.dates[index];
              final isSelected = index == state.selectedIndex;
              return GestureDetector(
                onTap: () {
                  context.read<DateSelectCubit>().selectDate(index);
                },
                child: Container(
                  width: 60.w,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ColorsManager.primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(color: ColorsManager.primaryColor),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${date.day}',
                            style: Styles.textStyle24P.copyWith(
                              color: isSelected
                                  ? Colors.white
                                  : ColorsManager.primaryColor,
                            )),
                        SizedBox(height: 4.h),
                        Text(
                          DateFormat('E').format(date).toLowerCase(),
                          style: Styles.textStyle14P.copyWith(
                            color: isSelected
                                ? Colors.white
                                : ColorsManager.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
