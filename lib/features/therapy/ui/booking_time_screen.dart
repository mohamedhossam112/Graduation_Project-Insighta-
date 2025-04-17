import 'package:flutter/material.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/therapy/ui/widgets/booking_screen_body.dart';

class BookingTimeScreen extends StatelessWidget {
  const BookingTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
