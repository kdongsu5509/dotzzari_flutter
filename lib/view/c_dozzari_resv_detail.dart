import 'package:dotzzari/common/default_layout.dart';
import 'package:dotzzari/component/option_title_box.dart';
import 'package:dotzzari/view/c_dozzari_resv_detail_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/const/dozzari_color.dart';
import '../common/dozzari_flexible_size.dart';
import '../component/add_on_item.dart';
import '../component/orange_button.dart';

class DozzariResvDetail extends ConsumerStatefulWidget {
  const DozzariResvDetail({super.key});

  @override
  ConsumerState<DozzariResvDetail> createState() => _DozzariResvState();
}

class _DozzariResvState extends ConsumerState<DozzariResvDetail> {
  @override
  Widget build(BuildContext context) {
    List<int> quantities = List.filled(10, 0);
    return DefaultLayout(
      isDetail: true,
      child: Stack(
        children: [
          Positioned(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    height: dheight(context, 0.3),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          child: Image.asset(
                            'asset/image/picnic_main_img.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'asset/image/picnic_main_img.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'asset/image/picnic_main_img.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(dwidth(context, 0.05)),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.card_giftcard,
                                size: dwidth(context, 0.1),
                              ),
                              SizedBox(width: dwidth(context, 0.02)),
                              Text(
                                '도짜리 3호',
                                style: TextStyle(
                                    fontSize: dwidth(context, 0.075),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(
                            '도짜리, 캠핑박스, 테이블보, 줄전구, 랜턴, 담요 2개, 파우치, 종량제 5L',
                            style: TextStyle(fontSize: dwidth(context, 0.04)),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: BG_BLACK2,
                    height: dheight(context, 0.01),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: dwidth(context, 0.05)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: dheight(context, 0.015)),
                          optionTitleBox(context, title: '추가 선택 물품 (소모품)'),
                          SizedBox(height: dheight(context, 0.01)),
                        ],
                      )),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return AddOnItem(
                        title: '종이컵 + 종이컵 홀더 10개',
                        price: '+1000원',
                        quantity: quantities[index],
                        onIncrease: () {
                          setState(() {
                            quantities[index]++;
                          });
                        },
                      );
                    },
                    childCount: quantities.length,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            child: SizedBox(
              width: dwidth(context, 1),
              height: dheight(context, 0.055),
              child: OrangeButton(
                context,
                '102,700원 담기',
                0.05,
                0.005,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DozzariResvDetail2(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
