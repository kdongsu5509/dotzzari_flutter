import 'package:dotzzari/common/default_layout.dart';
import 'package:dotzzari/component/option_title_box.dart';
import 'package:dotzzari/dozzari_provider/optional_check_info_provider.dart';
import 'package:dotzzari/retrofit_repo/req_with_token.dart';
import 'package:dotzzari/view/c_dozzari_resv_detail_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/const/dozzari_color.dart';
import '../common/dozzari_flexible_size.dart';
import '../component/add_on_item.dart';
import '../component/orange_button.dart';
import '../retrofit_repo/custom_dio.dart';
import '../secret/dozzari_secret.dart';

/**
 * 해당 페이지에서 아래와 같은 문제점을 해결해야 합니다.
 *
 * 1. unnecessay와 necessary의 전달에 대해 명확히 들어야 합니다.
 *
 * 2. 1의 답변에 따라 AddOnItem의 구성을 달리 해야 합니다.
 *
 * 3. 다음 페이지로 넘어가기 전에 optionalCheckInfoList을 Provider를 이용해 값을 전역으로 관리하게 수정해야 합니다.
 */

class DozzariResvDetail extends ConsumerStatefulWidget {
  final String dozzariId;
  final String start;
  final String end;

  const DozzariResvDetail(this.dozzariId, this.start, this.end, {super.key});

  @override
  ConsumerState<DozzariResvDetail> createState() => _DozzariResvState();
}

class _DozzariResvState extends ConsumerState<DozzariResvDetail> {
  OrderPageResponse? resp;
  bool isLoading = true;

  List<Item> defaultItems = [];
  List<Item> necessaryItems = [];
  List<Item> unnecessaryItems = [];

  List<optionalCheckInfo> optionalCheckInfoList = [];

  @override
  void initState() {
    final client = ReqWithToken(customDio, baseUrl: baseUrl);

    client.getOrderPage(widget.dozzariId, widget.start, widget.end).then(
      (value) {
        print('RESP : $value');
        setState(() {
          resp = value;
          defaultItems = value.categories[0].items;
          if (value.categories.length > 1)
            unnecessaryItems = value.categories[1].items;
          if (value.categories.length > 2)
            necessaryItems = value.categories[2].items;

          optionalCheckInfoList = List.generate(unnecessaryItems.length, (index) => optionalCheckInfo(false, unnecessaryItems[index].index, unnecessaryItems[index].price, 0));

          isLoading = false;
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return DefaultLayout(
      child: (resp == null || isLoading)
          ? Center(child: CircularProgressIndicator())
          : Stack(
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.card_giftcard,
                                      size: dwidth(context, 0.1),
                                    ),
                                    SizedBox(width: dwidth(context, 0.02)),
                                    Text(
                                      '도짜리 ${resp!.dozzariId.replaceAll('dozzari', '')}호',
                                      style: TextStyle(
                                          fontSize: dwidth(context, 0.075),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${defaultItem(defaultItems)}',
                                  style: TextStyle(
                                      fontSize: dwidth(context, 0.04)),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '${formatPrice(resp!.price)} 원',
                                  style: TextStyle(
                                      fontSize: dwidth(context, 0.05),
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
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
                                optionTitleBox(context,
                                    title: '추가 선택 물품 (소모품)'),
                                SizedBox(height: dheight(context, 0.01)),
                              ],
                            )),
                      ),
                      SliverList.builder(
                        itemCount: unnecessaryItems.length + necessaryItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AddOnItem(
                            title: unnecessaryItems[index].name,
                            price:
                                '${formatPrice(unnecessaryItems[index].price)} 원',
                            quantity: optionalCheckInfoList[index].quantity,
                            onIncrease: () {
                              print('increase is clicked');
                              setState(() {
                                optionalCheckInfoList[index].quantity++;
                                print('Updated quantity: ${optionalCheckInfoList[index].quantity}');
                              });
                              print('increase set State is finished');
                            },
                            onCheck: (value) {
                              print('check is clicked');
                              setState(() {
                                optionalCheckInfoList[index].checked = value!;
                              });
                              print('check set State is finished');
                            },
                            isChecked: optionalCheckInfoList[index].checked,
                          );
                        },
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(height: dheight(context, 0.08)),
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
                      '${calculateTotalPrice(optionalCheckInfoList, resp!.price)}원 담기',
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

String formatPrice(int price) {
  String priceString = price.toString();
  StringBuffer formatted = StringBuffer();

  int length = priceString.length;
  for (int i = 0; i < length; i++) {
    formatted.write(priceString[i]);
    // 3자리마다 콤마 추가
    if ((length - i - 1) % 3 == 0 && i != length - 1) {
      formatted.write(',');
    }
  }

  return formatted.toString();
}

String defaultItem(List<Item> items) {
  StringBuffer defaultItem = StringBuffer();

  for (int i = 0; i < items.length; i++) {
    defaultItem.write(items[i].name);
    if (i != items.length - 1) defaultItem.write(', ');
  }

  return defaultItem.toString();
}

String calculateTotalPrice(List<optionalCheckInfo> optionalCheckInfoList, int defaultPrice) {
  int totalPrice = defaultPrice;

  for(int i = 0; i < optionalCheckInfoList.length; i++) {
    totalPrice += (optionalCheckInfoList[i].price * optionalCheckInfoList[i].quantity);
  }

  return formatPrice(totalPrice);
}
