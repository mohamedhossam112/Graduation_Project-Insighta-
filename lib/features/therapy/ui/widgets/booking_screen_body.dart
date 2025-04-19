import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/features/therapy/logic/time_select_cubit/time_select_cubit.dart';
import 'package:insighta/features/therapy/ui/widgets/date_select_list_view.dart';
import 'package:insighta/features/therapy/ui/widgets/time_slot.dart';

class BookingScreenBody extends StatelessWidget {
  const BookingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.h,
          ),
          SizedBox(height: 100.h, child: DateSelectListView()),
          SizedBox(
            height: 24.h,
          ),
          Divider(
            height: 1.h,
            thickness: 1,
            color: ColorsManager.primaryColor,
          ),
          SizedBox(
            height: 24.h,
          ),
          BlocBuilder<TimeSelectCubit, TimeSelectState>(
            builder: (context, state) {
              if (state is TimeSelectLoaded) {
                return Column(
                  children: [
                    TimeSlot(title: 'Morning', slots: state.morningSlots),
                    SizedBox(
                      height: 28.h,
                    ),
                    TimeSlot(title: 'Afternoon', slots: state.afternoonSlots),
                    SizedBox(
                      height: 28.h,
                    ),
                    TimeSlot(title: 'Night', slots: state.eveningSlots),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}
