import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/therapy/logic/appointment_cubit/appointment_cubit.dart';
import 'package:insighta/features/therapy/logic/date_select_cubit/date_select_cubit.dart';
import 'package:insighta/features/therapy/logic/time_select_cubit/time_select_cubit.dart';
import 'package:insighta/features/therapy/ui/widgets/select_time_slots_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectTimeSlotsScreen extends StatelessWidget {
  const SelectTimeSlotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DateSelectCubit(),
        ),
        BlocProvider(
          create: (context) => TimeSelectCubit(),
        ),
        BlocProvider(
          create: (context) => AppointmentCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(),
          centerTitle: true,
          title: Text(
            'Select Time Slots',
            style: Styles.textStyle24P,
          ),
        ),
        body: SafeArea(child: SelectTimeSlotsScreenBody()),
        floatingActionButton: BlocBuilder<AppointmentCubit, AppointmentState>(
          builder: (context, state) {
            return FloatingActionButton.extended(
              backgroundColor: ColorsManager.lightGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r)),
              onPressed: () {
                /*   if (state is AppointmentSuccess) {
                  Navigator.pushNamed(context, '/bookingSuccessScreen');
                } else if (state is AppointmentFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select both date and time')),
                  );
                }*/

                final dateState = context.read<DateSelectCubit>().state;
                final timeState = context.read<TimeSelectCubit>().state;

                if (dateState is DateSelectLoaded &&
                    timeState is TimeSelectLoaded &&
                    timeState.selectedTime != null) {
                  final selectedDate = dateState.dates[dateState.selectedIndex];
                  final selectedTime = timeState.selectedTime!;

                  // Trigger Cubit to emit success (this will be listened to by the listener)
                  context
                      .read<AppointmentCubit>()
                      .confirmAppointment(selectedDate, selectedTime);
                } else {
                  // Show error message if time not selected
                  context.read<AppointmentCubit>().showError();
                }
              },
              icon: Icon(
                FontAwesomeIcons.check,
                color: ColorsManager.primaryColor,
                size: 50.sp,
              ),
              label: Text(
                'Book Now',
                style: Styles.textStyle20P,
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
