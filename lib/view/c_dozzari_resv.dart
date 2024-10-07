import 'package:dotzzari/component/custom_time_select_box.dart';
import 'package:dotzzari/component/dozzari_card.dart';
import 'package:dotzzari/component/main_image_tile.dart';
import 'package:dotzzari/component/dozzari_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/const/dozzari_color.dart';
import '../common/dozzari_flexible_size.dart';
import '../dozzari_provider/available_dozzari_provider.dart';
import '../dozzari_provider/time_select_box_provider.dart';
import '../retrofit_repo/custom_dio.dart';
import '../retrofit_repo/req_no_token.dart';
import '../secret/dozzari_secret.dart';
import 'c_dozzari_resv_detail.dart';

class DozzariResv extends ConsumerStatefulWidget {
  const DozzariResv({super.key});

  @override
  ConsumerState<DozzariResv> createState() => _DozzariResvState();
}

class _DozzariResvState extends ConsumerState<DozzariResv> {
  late int _length = 3;
  late final resp;
  bool isLoading = true;

  late final _start;
  late final _end;

  // late final resp;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializing();
    });
  }

  void initializing() async {
    final client = ReqNoToken(customDio, baseUrl: baseUrl);

    String reqestMinute = (DateTime.now().minute > 30) ? '00' : '30';

    //AvailableDozzarisResponse
    // final response = await client.getDozzaris(
    //   '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${reqestMinute}',
    //   '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().add(Duration(hours: 2)).hour.toString().padLeft(2, '0')}:${reqestMinute}',
    // );
    final response = await client.getDozzaris(
      '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day.toString().padLeft(2, '0')} 14:${reqestMinute}',
      '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day.toString().padLeft(2, '0')} 16:${reqestMinute}',
    );
    print('RESP : $response');
    setState(() {
      ref
          .read(AvailableDozzariProvider.notifier)
          .setAvailableDozzaris(response);
      _length = response.length;
      resp = response;
      isLoading = false; // 로딩 상태 해제
      // _start =
      // '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${reqestMinute}';
      // _end =
      // '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().add(Duration(hours: 2)).hour.toString().padLeft(2, '0')}:${reqestMinute}';
      _start =
      '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day.toString().padLeft(2, '0')} 14:${reqestMinute}';
      _end =
      '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day.toString().padLeft(2, '0')} 16:${reqestMinute}';
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isStartTapped = ref.watch(isStartTappedProvider);
    bool isEndTapped = ref.watch(isEndTappedProvider);

    return Padding(
      padding: EdgeInsets.fromLTRB(dwidth(context, 0.05), dwidth(context, 0.0),
          dwidth(context, 0.05), dwidth(context, 0.05)),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: MainImageTile(),
          ),
          SliverToBoxAdapter(
            child: DozzariCheckBox(
              boxExpain: '도짜리를 이용할 일정을 선택해주세요',
              buttonName: '도짜리 조회하기',
              isTime: true,
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
              '이용 가능한 도짜리',
              style: TextStyle(
                fontSize: dheight(context, 0.025),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          (isLoading)
              ? SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        height: dheight(context, 0.15),
                      ),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                )
              : (resp.length == 0)
                  ? SliverToBoxAdapter(
                      child: Column(
                        children: [
                          SizedBox(
                            height: dheight(context, 0.15),
                          ),
                          Center(
                            child: Text(
                              '텅',
                              style: GoogleFonts.akshar(
                                fontSize: dheight(context, 0.05),
                                color: FONT_GRAY4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SliverList.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DozzariResvDetail(
                                    resp[index].dozzariId, _start, _end),
                              ),
                            );
                          },
                          child: DozzariCard(index),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          height: 0,
                          thickness: 1,
                          color: FONT_GRAY4,
                        );
                      },
                      itemCount: _length,
                    ),
        ],
      ),
    );
  }
}
