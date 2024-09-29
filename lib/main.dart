import 'package:dotzzari/view/a_view_root_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dozzari_provider/provider_logger.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [ProviderLogger()],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        fontFamily: 'NotoSansKR',
        iconTheme: CupertinoIconThemeData(color: Colors.black),
      ),
      home: const ViewRootTab(),
    );
  }
}
