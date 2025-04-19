// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:insighta/features/therapy/ui/widgets/booking_success_screen_body.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({
    Key? key,
    required this.date,
    required this.time,
  }) : super(key: key);
  final DateTime date;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookingSuccessScreenBody(
          date: date,
          time: time,
        ),
      ),
    );
  }
}
