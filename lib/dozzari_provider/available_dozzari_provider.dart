import 'package:dotzzari/retrofit_repo/req_no_token.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AvailableDozzariState {
  final List<Dozzari> availableDozzaris;

  AvailableDozzariState(this.availableDozzaris);
}

class AvailableDozzariNotifier extends StateNotifier<AvailableDozzariState> {
  AvailableDozzariNotifier() : super(AvailableDozzariState([]));

  void setAvailableDozzaris(List<Dozzari> availableDozzaris) {
    state = AvailableDozzariState(availableDozzaris);
  }
}

final AvailableDozzariProvider = StateNotifierProvider<AvailableDozzariNotifier, AvailableDozzariState>((ref) {
  return AvailableDozzariNotifier();
});