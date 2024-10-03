import 'package:dotzzari/component/custom_time_select_box.dart';
import 'package:dotzzari/component/dozzari_card.dart';
import 'package:dotzzari/component/main_image_tile.dart';
import 'package:dotzzari/component/dozzari_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/const/dozzari_color.dart';
import '../common/dozzari_flexible_size.dart';
import '../component/dozzari_history_card.dart';
import '../dozzari_provider/time_select_box_provider.dart';
import 'c_dozzari_resv_detail.dart';

class DozzariHistory extends ConsumerStatefulWidget {
  const DozzariHistory({super.key});

  @override
  ConsumerState<DozzariHistory> createState() => _DozzariResvState();
}

class _DozzariResvState extends ConsumerState<DozzariHistory> {
  @override
  Widget build(BuildContext context) {
    bool isStartTapped = ref.watch(isStartTappedProvider);
    bool isEndTapped = ref.watch(isEndTappedProvider);
    return Padding(
      padding: EdgeInsets.fromLTRB(dwidth(context, 0.05), dwidth(context, 0.0), dwidth(context, 0.05), dwidth(context, 0.05)),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: DozzariCheckBox(
              boxExpain: '이용 내역을 조회할 기간을 선택해 주세요',
              buttonName: '이용 내역 조회하기',
              isTime: false,
            ),
          ),
          SliverToBoxAdapter(
            child: (isStartTapped) ? CustomTimeSelectBox() : Container(),
          ),
          SliverToBoxAdapter(
            child: (isEndTapped) ? CustomTimeSelectBox() : Container(),
          ),
          SliverToBoxAdapter(
            child: Text(
              '이용 내역',
              style: TextStyle(
                fontSize: dheight(context, 0.025),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverList.separated(
            itemBuilder: (BuildContext context, int index) {
              return DozzariHistoryCard();
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: dheight(context, 0.02),
              );
            },
            itemCount: 5,
          ),
        ],
      ),
    );
  }
}
