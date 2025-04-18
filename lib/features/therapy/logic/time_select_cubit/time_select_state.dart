part of 'time_select_cubit.dart';

@immutable
sealed class TimeSelectState {}

final class TimeSelectInitial extends TimeSelectState {}

class TimeSelectLoaded extends TimeSelectState {
  final List<String> morningSlots;
  final List<String> afternoonSlots;
  final List<String> eveningSlots;
  final String? selectedTime;

  TimeSelectLoaded(
      {required this.morningSlots,
      required this.afternoonSlots,
      required this.eveningSlots,
      this.selectedTime});
}
