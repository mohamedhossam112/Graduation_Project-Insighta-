import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

part 'time_select_state.dart';

class TimeSelectCubit extends Cubit<TimeSelectState> {
  TimeSelectCubit() : super(TimeSelectInitial()) {
    generateTime();
  }
  void generateTime() {
    List<String> morning = generateTimeRange(9, 12);
    List<String> afternoon = generateTimeRange(13, 15);
    List<String> evening = generateTimeRange(17, 20);

    emit(TimeSelectLoaded(
      morningSlots: morning,
      afternoonSlots: afternoon,
      eveningSlots: evening,
    ));
  }

  List<String> generateTimeRange(int startHour, int endHour) {
    List<String> result = [];
    DateTime now = DateTime.now();

    for (int hour = startHour; hour < endHour; hour++) {
      result.add(DateFormat.jm()
          .format(DateTime(now.year, now.month, now.day, hour, 0)));
    }
    return result;
  }

  void selectTime(String time) {
    final current = state as TimeSelectLoaded;
    emit(TimeSelectLoaded(
      morningSlots: current.morningSlots,
      afternoonSlots: current.afternoonSlots,
      eveningSlots: current.eveningSlots,
      selectedTime: time,
    ));
  }
}
