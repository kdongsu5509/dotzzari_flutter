import 'package:flutter/material.dart';

/**
 * this files for declaerd the flexible size for the screen
 *
 * @param context
 * @param double -> that is used as a width or height
 *
 * written by: dongsu
 */

double dwidth(BuildContext context, double width) {
  return MediaQuery.of(context).size.width * width;
}

double dheight(BuildContext context, double height) {
  return MediaQuery.of(context).size.height * height;
}