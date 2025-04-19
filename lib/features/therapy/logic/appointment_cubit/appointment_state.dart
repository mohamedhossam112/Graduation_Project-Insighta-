part of 'appointment_cubit.dart';

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

final class AppointmentSuccess extends AppointmentState {
  final DateTime date;
  final String time;

  AppointmentSuccess({required this.date, required this.time});
}

final class AppointmentFailure extends AppointmentState {
  final String errMessage;

  AppointmentFailure(this.errMessage);
}
