import 'dart:ui';

import 'package:dotzzari/common/const/dozzari_color.dart';
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
        _blurredImagePart(context), // 이미지에만 블러 적용
        _textPart(context),         // 텍스트는 별도로 처리
      ],
    );
  }
}

// Widget _blurredImagePart(BuildContext context) {
//   return Image.asset(
//     'asset/image/img.png', // 이미지 경로
//     height: dheight(context, 0.2),
//     width: dwidth(context, 1),
//     fit: BoxFit.cover,
//     alignment: Alignment.center,
//   );
// }

//이미지 부분 (블러 처리된 이미지만)
Widget _blurredImagePart(BuildContext context) {
  return ClipRect( // 이미지만 클립핑
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // 블러 효과
      child: Image.asset(
        'asset/image/dozzari_info_background.png', // 이미지 경로
        height: dheight(context, 0.215),
        width: dwidth(context, 1),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        color: BRAND_PRIMARY_COLOR, // 어둡게 처리
        colorBlendMode: BlendMode.overlay, // 오버레이 처리
      ),
    ),
  );
}

// 텍스트 부분 (영향을 받지 않도록 분리)
Widget _textPart(BuildContext context) {
  return Positioned(
    right: dwidth(context, 0.05),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: dheight(context, 0.03)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('DOZZARI',
                style: GoogleFonts.caprasimo(
                  color: Colors.white,
                  fontSize: dwidth(context, 0.06),
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
                textAlign: TextAlign.right),
            Text(' 는,',
                style: GoogleFonts.caprasimo(
                  color: Colors.white,
                  fontSize: dwidth(context, 0.04),
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
                textAlign: TextAlign.right),
          ],
        ),
        SizedBox(height: dheight(context, 0.025)),
        Text(
            '경북대학교 학생들을 위한 피크낵 세트 대여\n서비스입니다.\n즐거운 캠퍼스 라이프 경험을 제공하기\n위해 노력하고 있습니다.\n오늘도 도짜리와 함께 즐거운 피크닉 되세요:)',
            style: TextStyle(
              color: Colors.white,
              fontSize: dwidth(context, 0.025),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.right),
      ],
    ),
  );
}
