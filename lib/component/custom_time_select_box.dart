import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/const/dozzari_color.dart';
import '../common/dozzari_flexible_size.dart';
import '../dozzari_provider/time_notifier.dart';
import '../dozzari_provider/time_select_box_provider.dart';

class CustomTimeSelectBox extends ConsumerStatefulWidget {
  @override
  _CustomTimeSelectBoxState createState() => _CustomTimeSelectBoxState();
}

class _CustomTimeSelectBoxState extends ConsumerState<CustomTimeSelectBox> {

  List<String> _hours = List.generate(24, (index) => (index + 1).toString());
  List<String> _minutes = ["00", "30"];

  @override
  Widget build(BuildContext context) {
    //시간 상태 관리자.
    TimeState timeState = ref.watch(timeNotifierProvider);
    //시작인지 종료인지
    bool isStartTapped = ref.watch(isStartTappedProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: BG_BLACK3,
          ),
          width: dwidth(context, 0.6),
          height: dheight(context, 0.25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 시간 선택 피커
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(
                      initialItem: isStartTapped ? timeState.startHour - 1 : timeState.endHour - 1),
                  onSelectedItemChanged: (int index) {
                    if(isStartTapped == true){
                      ref.read(timeNotifierProvider.notifier).setStartHour(index + 1);
                    } else{
                      ref.read(timeNotifierProvider.notifier).setEndHour(index + 1);
                    }
                  },
                  children: _hours.map((hour) {
                    return Center(child: Text(hour, style: TextStyle(fontSize: dwidth(context, 0.04), color: BRAND_PRIMARY_COLOR, fontWeight: FontWeight.w500)));
                  }).toList(),
                ),
              ),
              // 분 선택 피커
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(
                      initialItem: timeState.startMinute == 30 ? 1 : 0),
                  onSelectedItemChanged: (int index) {
                    if(isStartTapped == true){
                      ref.read(timeNotifierProvider.notifier).setStartMinute(int.parse(_minutes[index]));
                    } else{
                      ref.read(timeNotifierProvider.notifier).setEndMinute(int.parse(_minutes[index]));
                    }
                  },
                  children: _minutes.map((minute) {
                    return Center(child: Text(minute, style: TextStyle(fontSize: dwidth(context, 0.04), color: BRAND_PRIMARY_COLOR, fontWeight: FontWeight.w500)));
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
