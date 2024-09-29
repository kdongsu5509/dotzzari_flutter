import 'package:flutter/material.dart';

import '../common/const/dozzari_color.dart';
import '../common/dozzari_flexible_size.dart';

Widget OrageButton(
    BuildContext context,
    String text,
    double textSize,
    double buttonHeight,
    ) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: dwidth(context, 0.04)),
    child: ElevatedButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(fontSize: dwidth(context, textSize)),
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(BRAND_SECONDARY_COLOR),
        foregroundColor: WidgetStateProperty.all(BG_WHITE),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              dheight(context, buttonHeight),
            ),
          ),
        ),
      ),
    ),
  );
}