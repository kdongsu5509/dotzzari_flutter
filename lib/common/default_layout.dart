import 'package:dotzzari/common/dozzari_flexible_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/**
 * 주요 화면에서 사용될 기본 레이아웃 파일
 *
 *  - 상단 로고만 기본으로 정의해놓았습니다.
 *
 * @param appbar -> nullable -> 하단 네비게이션 바.
 * @param child -> 화면에 표시될 위젯
 *    - 모든 child는 padding을 가지고 있습니다.
 *
 *
 * written by: dongsu
 */

class DefaultLayout extends ConsumerStatefulWidget {
  Widget child;
  BottomNavigationBar? bottomNavigationBar;
  bool? isDetail;

  DefaultLayout({
    required this.child,
    this.bottomNavigationBar,
    this.isDetail,
    super.key,
  });

  @override
  ConsumerState<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends ConsumerState<DefaultLayout>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Image.asset(
            'asset/image/dozzari_tumyeong_logo.png',
            height: dheight(context, 0.0275),
          ),
        ),
      ),
      bottomNavigationBar: (widget.bottomNavigationBar != null)
          ? widget.bottomNavigationBar
          : null,
      body: (widget.isDetail == null || widget.isDetail == false)
          ? Padding(
              padding: EdgeInsets.all(dwidth(context, 0.05)),
              child: widget.child,
            )
          : widget.child,
    );
  }
}
