import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'date_select_state.dart';

class DateSelectCubit extends Cubit<DateSelectState> {
  DateSelectCubit() : super(DateSelectInitial()) {
    generateDates();
  }

  void generateDates() {
    final today = DateTime.now();
    final upcomingDates = List.generate(7, (i) => today.add(Duration(days: i)));
    emit(DateSelectLoaded(selectedIndex: 0, dates: upcomingDates));
  }

  void selectDate(int index) {
    if (state is DateSelectLoaded) {
      final currentState = state as DateSelectLoaded;
      emit(DateSelectLoaded(selectedIndex: index, dates: currentState.dates));
    }
  }
}
