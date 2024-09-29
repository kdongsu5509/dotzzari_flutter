import 'package:dotzzari/common/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DozzariResvDetail2 extends ConsumerStatefulWidget {
  const DozzariResvDetail2({super.key});

  @override
  ConsumerState<DozzariResvDetail2> createState() => _DozzariResvDetail2State();
}

class _DozzariResvDetail2State extends ConsumerState<DozzariResvDetail2> {
  @override
  Widget build(BuildContext context) {
    List<int> quantities = List.filled(10, 0);
    return DefaultLayout(
      isDetail: true,
      child: Text('주문 내역 확인하기')
    );
  }
}
