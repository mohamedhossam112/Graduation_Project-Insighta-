import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/therapy/logic/date_select_cubit/date_select_cubit.dart';
import 'package:insighta/features/therapy/logic/time_select_cubit/time_select_cubit.dart';
import 'package:insighta/features/therapy/ui/widgets/booking_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

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
        body: SafeArea(child: BookingScreenBody()),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: ColorsManager.lightGrey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          onPressed: () {
            Navigator.pushNamed(context, '/bookingSuccessScreen');
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
