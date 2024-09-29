import 'package:dotzzari/common/default_layout.dart';
import 'package:dotzzari/component/custom_time_select_box.dart';
import 'package:dotzzari/component/dozzari_card.dart';
import 'package:dotzzari/component/main_image_tile.dart';
import 'package:dotzzari/component/dozzari_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/const/dozzari_color.dart';
import '../common/dozzari_flexible_size.dart';
import '../dozzari_provider/time_select_box_provider.dart';

class DozzariResvDetail extends ConsumerStatefulWidget {
  const DozzariResvDetail({super.key});

  @override
  ConsumerState<DozzariResvDetail> createState() => _DozzariResvState();
}

class _DozzariResvState extends ConsumerState<DozzariResvDetail> {
  @override
  Widget build(BuildContext context) {
    bool isStartTapped = ref.watch(isStartTappedProvider);
    bool isEndTapped = ref.watch(isEndTappedProvider);

    return DefaultLayout(
      isDetail: true,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Image.asset(
              'asset/image/picnic_main_img.png',
              fit: BoxFit.cover,
            ),
          ),
          SliverList.separated(
            itemBuilder: (BuildContext context, int index) {
              return DozzariCard();
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
      ),
    );
  }
}
