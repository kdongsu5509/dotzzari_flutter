import 'package:dotzzari/common/const/dozzari_color.dart';
import 'package:dotzzari/common/dozzari_flexible_size.dart';
import 'package:dotzzari/component/orange_button.dart';
import 'package:dotzzari/dozzari_provider/time_select_box_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dozzari_provider/date_notifier.dart';
import '../dozzari_provider/time_notifier.dart';

/**
 * 각종 검색 조건을 조회할 때 사용하는 Frame 위젯입니다.
 *
 * written by: dongsu
 */

class DozzariCheckBox extends ConsumerStatefulWidget {
  final String boxExpain;
  final String buttonName;
  final bool isTime;

  const DozzariCheckBox({required this.buttonName,
    required this.boxExpain,
    required this.isTime,
    super.key});

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
                _boxTitle(context, widget.boxExpain),
                SizedBox(
                  height: dheight(context, 0.0025),
                ),
                (widget.isTime) ? _boxSubTitle(context) : Container(),
                SizedBox(
                  height: dheight(context, 0.0075),
                ),
                (widget.isTime)
                    ? _timeSelectBox(context, ref)
                    : _dateSelectBox(context, ref),
                SizedBox(
                  height: dheight(context, 0.0075),
                ),
                OrangeButton(context, widget.buttonName, 0.035, 0.005),
              ],
            ),
          )),
    );
  }
}

Widget _boxTitle(BuildContext context,
    String boxExpain,) {
  return Center(
    child: Text(
      boxExpain,
      style: TextStyle(
          fontSize: dwidth(context, 0.032), fontWeight: FontWeight.w500),
    ),
  );
}

Widget _timeSelectBox(BuildContext context,
    WidgetRef ref,) {
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
        height: dheight(context, 0.04),
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
                if (ref.watch(isEndTappedProvider) == true) {
                  ref
                      .read(isEndTappedProvider.notifier)
                      .update((state) => false);
                }
                ref
                    .read(isStartTappedProvider.notifier)
                    .update((state) => !state);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    size: dwidth(context, 0.04),
                  ),
                  SizedBox(width: dwidth(context, 0.02)),
                  Text(
                    '시작 시간',
                    style: ts,
                  ),
                  SizedBox(width: dwidth(context, 0.02)),
                  Text(
                    '${timeState.startHour.toString().padLeft(
                        2, '0')}:${timeState.startMinute.toString().padLeft(
                        2, '0')}',
                    style: ts.copyWith(color: BRAND_SECONDARY_COLOR),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (ref.watch(isStartTappedProvider) == true) {
                  ref
                      .read(isStartTappedProvider.notifier)
                      .update((state) => false);
                }
                ref
                    .read(isEndTappedProvider.notifier)
                    .update((state) => !state);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    size: dwidth(context, 0.04),
                  ),
                  SizedBox(width: dwidth(context, 0.02)),
                  Text(
                    '종료 시간',
                    style: ts,
                  ),
                  SizedBox(width: dwidth(context, 0.02)),
                  Text(
                    '${timeState.endHour.toString().padLeft(2, '0')}:${timeState
                        .endMinute.toString().padLeft(2, '0')}',
                    style: ts.copyWith(color: BRAND_SECONDARY_COLOR),
                  )
                ],
              ),
            ),
          ],
        )),
  );
}

Widget _dateSelectBox(
    BuildContext context,
    WidgetRef ref,
    ) {
  TextStyle ts = TextStyle(
    fontSize: dwidth(context, 0.03),
    fontWeight: FontWeight.w500,
  );

  DateState dateState = ref.watch(dateNotifierProvider); // 상태를 자동으로 업데이트
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: dwidth(context, 0.04),
    ),
    child: Container(
      height: dheight(context, 0.04),
      decoration: BoxDecoration(
        color: BG_WHITE,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // 그림자 위치 조정
          ),
        ],
        borderRadius: BorderRadius.circular(dheight(context, 0.005)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: dwidth(context, 0.04),
              ),
              SizedBox(width: dwidth(context, 0.02)),
              Text(
                '이용일',
                style: ts.copyWith(color: FONT_GRAY4),
              ),
              SizedBox(width: dwidth(context, 0.02)),
            ],
          ),
          GestureDetector(
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => Container(
                  height: dheight(context, 0.3),
                  color: Colors.white,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (DateTime value) {
                      ref
                          .read(dateNotifierProvider.notifier)
                          .setStartDate(value);
                    },
                  ),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  '${dateState.startDate.year}년 ${dateState.startDate.month}월 ${dateState.startDate.day}일',
                  style: ts,
                ),
              ],
            ),
          ),
          Text(
            ' ~ ',
            style: ts,
          ),
          GestureDetector(
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => Container(
                  height: dheight(context, 0.3),
                  color: Colors.white,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (DateTime value) {
                      ref
                          .read(dateNotifierProvider.notifier)
                          .setEndDate(value);
                    },
                  ),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  '${dateState.endDate.year}년 ${dateState.endDate.month}월 ${dateState.endDate.day}일',
                  style: ts,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


Widget _boxSubTitle(BuildContext context,) {
  return Center(
    child: Text(
      ' " 예약 가능 시간 : 10시 30분 ~ 22시\n반납 마감 시간 : 익일 00시 00분 "',
      style: TextStyle(fontSize: dwidth(context, 0.03), color: FONT_GRAY3),
    ),
  );
}
