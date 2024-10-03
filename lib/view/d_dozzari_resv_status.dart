import 'package:dotzzari/common/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/const/dozzari_color.dart';
import '../common/dozzari_flexible_size.dart';
import '../component/option_title_box.dart';
import '../component/orange_button.dart';

class DozzariResvStatus extends ConsumerStatefulWidget {
  const DozzariResvStatus({super.key});

  @override
  ConsumerState<DozzariResvStatus> createState() => _DozzariResvDetail2State();
}

class _DozzariResvDetail2State extends ConsumerState<DozzariResvStatus> {
  String _selectedLocation = '센트럴파크 옆 농구장';
  List<int> cntList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int cnt = 5;

  String customerRequire = '';
  String phoneNum = '';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
            child: Column(
              children: [
                Center(
                  child: Text(
                    '예약이 확정되었습니다',
                    style: TextStyle(
                        fontSize: dwidth(context, 0.06),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: dheight(context, 0.015),
                ),
                Center(
                  child: Text(
                    '도짜리와 함게하는 즐거운 피크닉 되세요',
                    style: TextStyle(
                      fontSize: dwidth(context, 0.04),
                    ),
                  ),
                ),
              ],
            )),
        SliverToBoxAdapter(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '도짜리 3호',
                  style: TextStyle(
                      fontSize: dwidth(context, 0.065),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '· 이용 시간 : 2024년 9월 24일 10:30 ~ 12:30',
                  style: TextStyle(fontSize: dwidth(context, 0.035)),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '도짜리, 캠핑박스, 테이블보, 줄전구, 랜턴, 담요 2개, 파우치, 종량제 5L',
                  style: TextStyle(fontSize: dwidth(context, 0.035)),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Divider(
                  color: Colors.black,
                  thickness: 0.3,
                ),
                Text(
                  '추가 선택 물품',
                  style: TextStyle(
                      fontSize: dwidth(context, 0.045),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '· 종이컵 + 종이컵 홀더 10개 * 2',
                  style: TextStyle(fontSize: dwidth(context, 0.035)),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '· 일회용 접시 5개',
                  style: TextStyle(fontSize: dwidth(context, 0.035)),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '2,700원',
                  style: TextStyle(
                      fontSize: dwidth(context, 0.045),
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget optionWithText(
  BuildContext context,
  String title,
  double titleSize,
  String hintText,
  bool isRequired,
  ValueChanged<String>? onchanged,
) {
  return Padding(
    padding: EdgeInsets.all(dwidth(context, 0.02)),
    child: Column(
      children: [
        optionTitleBox(context,
            title: title, isRequired: isRequired, titleSize: titleSize),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.all(10),
          ),
          onChanged: onchanged,
        ),
      ],
    ),
  );
}
