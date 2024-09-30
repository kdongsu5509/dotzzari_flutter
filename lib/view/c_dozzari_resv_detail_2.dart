import 'package:dotzzari/common/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/const/dozzari_color.dart';
import '../common/dozzari_flexible_size.dart';
import '../component/option_title_box.dart';
import '../component/orange_button.dart';
import 'c_dozzari_resv_final.dart';

class DozzariResvDetail2 extends ConsumerStatefulWidget {
  const DozzariResvDetail2({super.key});

  @override
  ConsumerState<DozzariResvDetail2> createState() => _DozzariResvDetail2State();
}

class _DozzariResvDetail2State extends ConsumerState<DozzariResvDetail2> {
  String _selectedLocation = '센트럴파크 옆 농구장';
  List<int> cntList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int cnt = 5;

  String customerRequire = '';
  String phoneNum = '';

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isDetail: true,
      child: Stack(
        children: [
          Positioned(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      '주문 내역 확인하기',
                      style: TextStyle(
                          fontSize: dwidth(context, 0.06),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(dwidth(context, 0.05)),
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
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: BG_BLACK2,
                    height: dheight(context, 0.01),
                  ),
                ),
                _detail2OptionBox(
                  context,
                  '추가 선택 물품 (소모품)',
                  Column(
                    children: [
                      RadioListTile(
                        fillColor:
                            WidgetStateProperty.all(BRAND_SECONDARY_COLOR),
                        title: Text('센트럴파크 옆 농구장'),
                        value: '센트럴파크 옆 농구장',
                        groupValue: _selectedLocation,
                        onChanged: (String? value) {
                          print('센트럴파크 옆 농구장 선택됨');
                          setState(() {
                            _selectedLocation = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        fillColor:
                            WidgetStateProperty.all(BRAND_SECONDARY_COLOR),
                        title: Text('호반우 벤치'),
                        value: '호반우 벤치',
                        groupValue: _selectedLocation,
                        onChanged: (String? value) {
                          print('호반우 벤치 선택됨');
                          setState(() {
                            _selectedLocation = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                _detail2OptionBox(
                  context,
                  '도짜리 사용 인원',
                  DropdownButton(
                    value: cnt,
                    items: cntList
                        .map((e) => DropdownMenuItem(
                              value: e, // 선택 시 onChanged 를 통해 반환할 value
                              child: Text('$e 명'),
                            ))
                        .toList(),
                    onChanged: (value) {
                      // items 의 DropdownMenuItem 의 value 반환
                      setState(() {
                        cnt = value!;
                      });
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: dwidth(context, 0.05)),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          optionWithText(
                            context,
                            '요청사항/특이사항',
                            0.02,
                            '요청사항을 입력해주세요',
                            false,
                            (value) {
                              customerRequire = value;
                            },
                          ),
                          optionWithText(
                            context,
                            '연락처',
                            0.02,
                            '연락처를 입력해주세요',
                            true,
                            (value) {
                              phoneNum = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            child: SizedBox(
              width: dwidth(context, 1),
              height: dheight(context, 0.055),
              child: OrangeButton(
                context,
                '지금 바로 예약하기',
                0.05,
                0.005,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DozzariResvFinal(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

SliverToBoxAdapter _detail2OptionBox(
  BuildContext context,
  String optionTitle,
  Widget child,
) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: dwidth(context, 0.05)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: dheight(context, 0.015)),
          optionTitleBox(context, title: optionTitle, isRequired: true),
          SizedBox(height: dheight(context, 0.01)),
          child,
        ],
      ),
    ),
  );
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
