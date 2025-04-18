part of 'date_select_cubit.dart';

@immutable
sealed class DateSelectState {}

final class DateSelectInitial extends DateSelectState {}

class DateSelectLoaded extends DateSelectState {
  final int selectedIndex;
  final List<DateTime> dates;

  DateSelectLoaded({
    required this.selectedIndex,
    required this.dates,
  });
}
