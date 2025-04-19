import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(AppointmentInitial());

  void confirmAppointment(DateTime date, String time) {
    emit(AppointmentSuccess(date: date, time: time));
  }

  void showError() {
    emit(AppointmentFailure("Please select a time slot"));
  }
}
