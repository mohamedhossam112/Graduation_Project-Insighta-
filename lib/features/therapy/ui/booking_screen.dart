import 'package:flutter/material.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/therapy/logic/date_select_cubit/date_select_cubit.dart';
import 'package:insighta/features/therapy/ui/widgets/booking_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DateSelectCubit(),
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
      ),
    );
  }
}
