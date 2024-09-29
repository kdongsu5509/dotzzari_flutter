import 'package:dotzzari/common/dozzari_flexible_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/**
 * 메인 화면에 사용될 이미지 타일
 *
 * 두 부분으로 구성 -> 이미지 부분, 텍스트 부분
 *
 * written by: dongsu
 */

class MainImageTile extends StatelessWidget {
  const MainImageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _imagePart(context),
        _textPart(context),
      ],
    );
  }
}

// 이미지 부분
Image _imagePart(BuildContext context) {
  return Image.asset(
    height: dheight(context, 0.215),
    width: dwidth(context, 1),
    'asset/image/picnic_main_img.png',
    color: Color(0xFF734B34).withOpacity(0.6),
    colorBlendMode: BlendMode.darken,
    fit: BoxFit.cover,
    alignment: Alignment.topCenter,
  );
}

// 텍스트 부분
Widget _textPart(BuildContext context){
  return Positioned(
    right: dwidth(context, 0.05),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: dheight(context, 0.03)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'DOZZARI',
              style: GoogleFonts.caprasimo(
                color: Colors.white,
                fontSize: dwidth(context, 0.1),
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
            Text(
              ' 는,',
              style: GoogleFonts.caprasimo(
                color: Colors.white,
                fontSize: dwidth(context, 0.05),
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: dheight(context, 0.015)),
        Text(
            '경북대학교 학생들을 위한 피크낵 세트 대여\n서비스입니다.\n뭐시기뭐시기를 추구하며, 뭐시기뭐시기 하기\n위해 노력하고 있습니다.\n오늘도 도짜리와 함께 즐거운 피크닉 되세요:)',
            style: TextStyle(
              color: Colors.white,
              fontSize: dwidth(context, 0.03),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.right
        ),
      ],
    ),
  );
}