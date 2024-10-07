import 'package:flutter_riverpod/flutter_riverpod.dart';

final optinalCheckInfoNotifierProvider = StateNotifierProvider<optinalCheckInfoNotifier, List<optionalCheckInfo>>((ref) {
  return optinalCheckInfoNotifier();
});

class optinalCheckInfoNotifier extends StateNotifier<List<optionalCheckInfo>> {
  optinalCheckInfoNotifier() : super([]);

  void add(optionalCheckInfo info) {
    state = [...state, info];
  }

  void remove(int index) {
    state = state.where((element) => element.index != index).toList();
  }

  void update(bool checked,int index, int price, int quantity) {
    state = state.map((e) {
      if (e.index == index) {
        return optionalCheckInfo(checked, index, price, quantity);
      } else {
        return e;
      }
    }).toList();
  }
}

class optionalCheckInfo {
  bool checked;
  int index;
  int price;
  int quantity;

  optionalCheckInfo(this.checked, this.index, this.price, this.quantity);
}