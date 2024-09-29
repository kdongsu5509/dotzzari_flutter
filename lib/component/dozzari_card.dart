import 'package:flutter/material.dart';

import '../common/dozzari_flexible_size.dart';

class DozzariCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: dheight(context, 0.015)),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'asset/image/picnic_main_img.png',
                    height: dwidth(context, 0.25),
                    width: dwidth(context, 0.25),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: dwidth(context, 0.03)),
                child: Container(
                  height: dwidth(context, 0.23),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        '도짜리 1호',
                        style: TextStyle(fontSize: dwidth(context, 0.05), fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: dheight(context, 0.005)),
                      Text(
                        '돗자리, 캠핑박스, 테이블보, 줄전구, 랜턴, 담요 2개,\n파우치, 종량제 5L',
                        style: TextStyle(fontSize: dwidth(context, 0.025)),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: dheight(context, 0.005)),
                      Text(
                        '전여 시간대: 10:30-12:00, 21:00-24:00',
                        style: TextStyle(fontSize: dwidth(context, 0.03), fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}