import 'package:dotzzari/component/custom_time_select_box.dart';
import 'package:dotzzari/component/dozzari_card.dart';
import 'package:dotzzari/component/main_image_tile.dart';
import 'package:dotzzari/component/dozzari_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/const/dozzari_color.dart';
import '../common/dozzari_flexible_size.dart';
import '../dozzari_provider/time_select_box_provider.dart';
import 'c_dozzari_resv_detail.dart';

class DozzariResv extends ConsumerStatefulWidget {
  const DozzariResv({super.key});

  @override
  ConsumerState<DozzariResv> createState() => _DozzariResvState();
}

class _DozzariResvState extends ConsumerState<DozzariResv> {
  @override
  Widget build(BuildContext context) {
    bool isStartTapped = ref.watch(isStartTappedProvider);
    bool isEndTapped = ref.watch(isEndTappedProvider);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: MainImageTile(),
        ),
        SliverToBoxAdapter(
          child: DozzariCheckBox(),
        ),
        SliverToBoxAdapter(
          child: (isStartTapped) ? CustomTimeSelectBox() : Container(),
        ),
        SliverToBoxAdapter(
          child: (isEndTapped) ? CustomTimeSelectBox() : Container(),
        ),
        SliverToBoxAdapter(
          child: Text(
            '이용 가능한 도짜리',
            style: TextStyle(
              fontSize: dheight(context, 0.025),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SliverList.separated(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DozzariResvDetail()),
                );
              },
              child: DozzariCard(),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 0,
              thickness: 1,
              color: FONT_GRAY4,
            );
          },
          itemCount: 5,
        ),
      ],
    );
  }
}
