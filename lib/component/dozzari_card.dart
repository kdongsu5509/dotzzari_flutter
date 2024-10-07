import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/dozzari_flexible_size.dart';
import '../dozzari_provider/available_dozzari_provider.dart';

class DozzariCard extends ConsumerStatefulWidget {
  final int index;

  DozzariCard(this.index);

  @override
  ConsumerState<DozzariCard> createState() => _DozzariCardState();
}

class _DozzariCardState extends ConsumerState<DozzariCard> {
  @override
  Widget build(BuildContext context) {

    final availableDozzaris = ref.watch(AvailableDozzariProvider).availableDozzaris;

    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: dheight(context, 0.015)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  availableDozzaris[widget.index].dozzariImageUrl,
                  // 'asset/image/picnic_main_img.png',
                  height: dwidth(context, 0.25),
                  width: dwidth(context, 0.25),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: dwidth(context, 0.03)),  // 간격 추가
            Expanded(  // 텍스트 영역을 차지할 수 있도록 Expanded로 감싸줌
              child: Container(
                height: dwidth(context, 0.23),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      '${availableDozzaris[widget.index].dozzariId}호',
                      // '도짜리 1호',
                      style: TextStyle(fontSize: dwidth(context, 0.05), fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${availableDozzaris[widget.index].setInfo}',
                      // '돗자리, 캠핑박스, 테이블보, 줄전구, 랜턴, 담요 2개, 파우치, 종량제 5L',  // 공백 수정
                      style: TextStyle(fontSize: dwidth(context, 0.025)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,  // 줄 바꿈 허용
                    ),
                    Text(
                      '전여 시간대: ${availableDozzaris[widget.index].availableTimes}',
                      style: TextStyle(fontSize: dwidth(context, 0.03), fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
