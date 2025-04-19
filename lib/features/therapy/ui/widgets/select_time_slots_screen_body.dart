import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/routing/routes.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/features/therapy/logic/appointment_cubit/appointment_cubit.dart';
import 'package:insighta/features/therapy/logic/date_select_cubit/date_select_cubit.dart';
import 'package:insighta/features/therapy/logic/time_select_cubit/time_select_cubit.dart';

import 'package:insighta/features/therapy/ui/widgets/date_select_list_view.dart';
import 'package:insighta/features/therapy/ui/widgets/time_slot.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class SelectTimeSlotsScreenBody extends StatelessWidget {
  const SelectTimeSlotsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocListener<AppointmentCubit, AppointmentState>(
        listener: (context, state) {
          if (state is AppointmentSuccess) {
            final dateState =
                context.read<DateSelectCubit>().state as DateSelectLoaded;
            final timeState =
                context.read<TimeSelectCubit>().state as TimeSelectLoaded;

            final selectedDate = dateState.dates[dateState.selectedIndex];
            final selectedTime = timeState.selectedTime;

            Navigator.pushNamed(
              context,
              Routes.bookingSuccessScreen,
              arguments: {
                'date': selectedDate,
                'time': selectedTime,
              },
            );
          } else if (state is AppointmentFailure) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.error(
                message: "Please select both date and time",
              ),
            );
          }
        },
        child: Padding(
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
                        TimeSlot(
                            title: 'Afternoon', slots: state.afternoonSlots),
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
        ),
      );
    });
  }
}
