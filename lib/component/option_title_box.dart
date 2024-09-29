import 'package:flutter/material.dart';

import '../common/const/dozzari_color.dart';
import '../common/dozzari_flexible_size.dart';

Widget optionTitleBox(
  BuildContext context, {
  bool isRequired = false,
  required String title,
  double titleSize = 0.025,
  double optionTextSize = 0.025,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: dheight(context, titleSize),
          fontWeight: FontWeight.bold,
        ),
      ),
      (isRequired)
          ? _ItemTypeBox(context, '필수', optionTextSize)
          : _ItemTypeBox(context, '선택', optionTextSize),
    ],
  );
}

Widget _ItemTypeBox(
  BuildContext context,
  String text,
  double textSize,
) {
  return Container(
    height: dheight(context, 0.03),
    width: dwidth(context, 0.1),
    decoration: BoxDecoration(
      color: Color(0xFFF9D29A),
      borderRadius: BorderRadius.circular(dheight(context, 0.02)),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
            color: BRAND_SECONDARY_COLOR,
            fontWeight: FontWeight.bold,
            fontSize: dwidth(context, textSize)),
      ),
    ),
  );
}
