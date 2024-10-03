import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateNotifier extends StateNotifier<DateState> {
  DateNotifier()
      : super(
    DateState(
            DateTime.now().subtract(Duration(days: 30)),
            DateTime.now(),
          ),
        );

  void setStartDate(DateTime date) {
    state = DateState(date, state.endDate,);
  }

  void setEndDate(DateTime date) {
    state = DateState(state.startDate, date,);
  }
}

class DateState {
  final DateTime startDate;
  final DateTime endDate;

  DateState(this.startDate, this.endDate,);
}

// Provider
final dateNotifierProvider =
    StateNotifierProvider<DateNotifier, DateState>((ref) {
  return DateNotifier();
});
