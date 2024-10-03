import 'package:dotzzari/common/const/dozzari_color.dart';
import 'package:flutter/material.dart';

import '../common/dozzari_flexible_size.dart';

class DozzariInfo extends StatelessWidget {
  const DozzariInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Image.asset(
          'asset/image/dozzari_info_background.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          color: BRAND_PRIMARY_COLOR,
          colorBlendMode: BlendMode.overlay,
        ),
        coverTexxt(context),
      ],
    );
  }
}

Widget coverTexxt(BuildContext context) {
  TextStyle bts = TextStyle(
    color: Colors.white,
    fontSize: dwidth(context, 0.06),
    fontWeight: FontWeight.w500,
  );
  TextStyle mts = bts.copyWith(
    fontSize: dwidth(context, 0.035),
  );
  TextStyle sts = mts.copyWith(
    fontSize: dwidth(context, 0.028),
    color: FONT_GRAY4,
  );
  return Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(dwidth(context, 0.07)),
            child: Column(
              children: [
                _topText(context,bts, mts, sts),
                SizedBox(height: dheight(context, 0.03)),
                _buttomText(context,bts, mts, sts),
              ],
            ),
          ),
        ),
      )
    ],
  );
}

Widget _topText(
    BuildContext context,
  TextStyle bts,
  TextStyle mts,
  TextStyle sts,
    ){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text('오늘의 도짜리는', style: bts, textAlign: TextAlign.right),
      SizedBox(height: dheight(context, 0.025)),
      Text('경북대 학생들을 위한 피크닉 대여 서비스입니다.\n즐거운 캠퍼스 라이프 경험을 제공하기 위해\n노력하고 있습니다', style: mts, textAlign: TextAlign.right),
      SizedBox(height: dheight(context, 0.05)),
      Text('피크닉 세트 예약은\n당일 이용 시간 60분 전까지 가능합니다', style: mts, textAlign: TextAlign.right),
      Text('예약 시간 : 10시 30분 ~ 22시 반납 마감 시간 : 익일 00시 00분', style: sts,textAlign: TextAlign.right),
      SizedBox(height: dheight(context, 0.03)),
      Text('이용요금은\n기본 2시간 이용 - 5000원 / 60분 추가 +3000원입니다.', style: mts, textAlign: TextAlign.right),
      Text('캠핑박스 + 테이블 보, 램프, led, 담요2개, 파우치, 쓰레기 봉투 10L', style: sts, textAlign: TextAlign.right),
      SizedBox(height: dheight(context, 0.03)),
      Text('필요한 물품은 추가 선택해 주시면 됩니다.\n입금 확인 후 예약이 확정됩니다:)', style: mts,textAlign: TextAlign.right),
    ],
  );
}

Widget _buttomText(
    BuildContext context,
    TextStyle bts,
    TextStyle mts,
    TextStyle sts,
    ){
  TextStyle nbts = bts.copyWith(
    fontSize: dwidth(context, 0.05),
  );
  TextStyle nmts = mts.copyWith(
    fontSize: dwidth(context, 0.03),
  );
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: dheight(context, 0.03)),
        Text('피크닉 세트 예약하기', style: bts,),
        SizedBox(height: dheight(context, 0.03)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('STEP 1', style: nbts,),
                Text('예약하기 메뉴에서\n도짜리를 이용할 시간과 세트를\n선택해 주세요!', style: nmts,),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('STEP 2', style: nbts,),
                Text('필요한 물품을 추가로\n자유롭게 선택해 주세요!', style: nmts,),
              ],
            ),
          ],
        ),
        SizedBox(height: dheight(context, 0.025)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('STEP 3', style: nbts,),
                Text('예약 현황 메뉴에서\n주문 내역을 확인하고\n입금을 완료해 주세요!', style: nmts,),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('STEP 4', style: nbts,),
                Text('입금 확인 시 예약이 완료!\n도짜리와 함께하는\n피크닉을 즐겨보세요!', style: nmts,),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}