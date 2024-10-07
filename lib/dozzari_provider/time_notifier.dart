import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeNotifier extends StateNotifier<TimeState> {
  TimeNotifier()
      : super(
          TimeState(
            DateTime.now().hour,
            DateTime.now().minute < 30 ? 0 : 30,
            DateTime.now().add(Duration(hours: 2)).hour,
            DateTime.now().minute < 30 ? 0 : 30,
          ),
        );

  void setStartHour(int hour) {
    state = TimeState(hour, state.startMinute,
        state.endHour, state.endMinute);
  }

  void setStartMinute(int minute) {
    state = TimeState(state.startHour, minute,
        state.endHour, state.endMinute);
  }

  void setEndHour(int hour) {
    state = TimeState(state.startHour, state.startMinute,
        hour, state.endMinute);
  }

  void setEndMinute(int minute) {
    state = TimeState(state.startHour, state.startMinute,
        state.endHour, minute);
  }
}

class TimeState {
  final int startHour;
  final int startMinute;
  final int endHour;
  final int endMinute;

  TimeState(this.startHour, this.startMinute,
      this.endHour, this.endMinute);
}

// Provider
final timeNotifierProvider =
    StateNotifierProvider<TimeNotifier, TimeState>((ref) {
  return TimeNotifier();
});
