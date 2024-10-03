import 'package:dotzzari/common/dozzari_flexible_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/const/dozzari_color.dart';

class DozzariHistoryCard extends StatelessWidget {
  const DozzariHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle bigFont =
        TextStyle(fontSize: dwidth(context, 0.047), fontWeight: FontWeight.w600);
    TextStyle middleFont = TextStyle(
        fontSize: dwidth(context, 0.043), fontWeight: FontWeight.w600);
    TextStyle smallFont =
        TextStyle(fontSize: dwidth(context, 0.03), color: FONT_GRAY3);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: FONT_GRAY4,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(dwidth(context, 0.05)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2024년 9월 26일',
              style: bigFont,
            ),
            Divider(
              color: Colors.black,
              thickness: 0.3,
              indent: dwidth(context, 0.05),
              endIndent: dwidth(context, 0.05),
            ),
            Text('도짜리 3호', style: middleFont),
            Text(
              '· 이용 시간 : 2024년 9월 24일 10:30 ~ 12:30',
              style: smallFont,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '· 배달/픽업 위치 : 센트럴파크 옆 농구장',
              style: smallFont,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '도짜리, 캠핑박스, 테이블보, 줄전구, 랜턴, 담요 2개, 파우치, 종량제 5L',
              style: smallFont,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text('추가 선택 물품', style: middleFont),
            Text(
              '· 종이컵 10개 * 2',
              style: smallFont,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '· 일회용 접시 5개',
              style: smallFont,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '2,700원',
              style: middleFont,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
