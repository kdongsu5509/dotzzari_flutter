import 'package:flutter_riverpod/flutter_riverpod.dart';

StateProvider<bool> isStartTappedProvider = StateProvider<bool>((ref) => false);
StateProvider<bool> isEndTappedProvider = StateProvider<bool>((ref) => false);