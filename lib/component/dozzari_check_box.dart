import 'package:dotzzari/common/const/dozzari_color.dart';
import 'package:dotzzari/common/dozzari_flexible_size.dart';
import 'package:dotzzari/component/orange_button.dart';
import 'package:dotzzari/dozzari_provider/time_select_box_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dozzari_provider/time_notifier.dart';

/**
 * 도짜리 이용 시작 시간 및 종료 시간을 선택하는 위젯입니다.
 *
 * written by: dongsu
 */

class DozzariCheckBox extends ConsumerStatefulWidget {
  const DozzariCheckBox({super.key});

  @override
  ConsumerState<DozzariCheckBox> createState() => _DozzariCheckBoxState();
}

class _DozzariCheckBoxState extends ConsumerState<DozzariCheckBox> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: dwidth(context, 0.04)),
      child: Container(
          decoration: BoxDecoration(
            color: BG_BLACK2,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: dheight(context, 0.015)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _boxTitle(context),
                _boxSubTitle(context),
                _timeSelectBox(context, ref),
                SizedBox(
                  height: dheight(context, 0.015),
                ),
                OrangeButton(context, '도짜리 조회하기', 0.0425, 0.005),
              ],
            ),
          )),
    );
  }
}

Widget _boxTitle(
  BuildContext context,
) {
  return Center(
    child: Text(
      '도짜리를 이용할 일정을 선택해주세요',
      style: TextStyle(
          fontSize: dwidth(context, 0.0425), fontWeight: FontWeight.bold),
    ),
  );
}

Widget _timeSelectBox(
  BuildContext context,
  WidgetRef ref,
) {
  TextStyle ts = TextStyle(
    fontSize: dwidth(context, 0.03),
    fontWeight: FontWeight.w500,
  );


  TimeState timeState = ref.watch(timeNotifierProvider); // 상태를 자동으로 업데이트
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: dwidth(context, 0.04),
    ),
    child: Container(
        decoration: BoxDecoration(
          color: BG_WHITE,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(dheight(context, 0.005)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                if(ref.watch(isEndTappedProvider) == true) {
                  ref.read(isEndTappedProvider.notifier).update((state) => false);
                }
                ref.read(isStartTappedProvider.notifier).update((state) => !state);
              },
              child: Row(
                children: [
                  Icon(Icons.access_time_rounded, size: dwidth(context, 0.035),),
                  SizedBox(width: dwidth(context, 0.02)),
                  Text(
                    '시작 시간',
                    style: ts,
                  ),
                  SizedBox(width: dwidth(context, 0.02)),
                  Text(
                    '${timeState.startHour.toString().padLeft(2, '0')}:${timeState.startMinute.toString().padLeft(2, '0')}',
                    style: ts.copyWith(color: BRAND_SECONDARY_COLOR),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if(ref.watch(isStartTappedProvider) == true) {
                  ref.read(isStartTappedProvider.notifier).update((state) => false);
                }
                ref.read(isEndTappedProvider.notifier).update((state) => !state);
              },
              child: Row(
                children: [
                  Icon(Icons.access_time_rounded, size: dwidth(context, 0.035),),
                  SizedBox(width: dwidth(context, 0.02)),
                  Text(
                    '종료 시간',
                    style: ts,
                  ),
                  Text(
                    '${timeState.endHour.toString().padLeft(2, '0')}:${timeState.endMinute.toString().padLeft(2, '0')}',
                    style: ts.copyWith(color: BRAND_SECONDARY_COLOR),
                  )
                ],
              ),
            ),
          ],
        )),
  );
}

Widget _boxSubTitle(
  BuildContext context,
) {
  return Center(
    child: Text(
      ' " 예약 가능 시간 : 10시 30분 ~ 22시\n반납 마감 시간 : 익일 00시 00분 "',
      style: TextStyle(fontSize: dwidth(context, 0.03), color: FONT_GRAY3),
    ),
  );
}