import 'package:dio/dio.dart';
import 'package:dotzzari/dozzari_stroage.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../view/a_login.dart';

class DioInterceptor extends Interceptor {
  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   if(options.path.contains('api/')){
  //
  //     options.headers.addAll({
  //       "Authorization": "Bearer ${dozzariStorage.read(key:'accessToken')}",
  //     });
  //
  //     print('토큰이 정상적으로 주입되었습니다');
  //     print('주입한 토큰 : ${dozzariStorage.read(key:'accessToken')}');
  //   }
  //
  //   print('REQUEST[${options.method}] => PATH: ${options.path} HEADER: ${options.headers} DATA: ${options.data}');
  //
  //   // TODO: implement onRequest
  //   super.onRequest(options, handler);
  // }
  //
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path.contains('api/')) {
      // 비동기 작업으로 토큰을 가져옴
      final accessToken = await dozzariStorage.read(key: 'accessToken');

      // 토큰이 정상적으로 있을 경우 Authorization 헤더 추가
      if (accessToken != null) {
        options.headers.addAll({
          "Authorization": "Bearer $accessToken",
        });
        print('토큰이 정상적으로 주입되었습니다');
        print('주입한 토큰 : $accessToken');
      } else {
        print('토큰이 없습니다.');
      }
    }

    print('REQUEST[${options.method}] => PATH: ${options.path} HEADER: ${options.headers} DATA: ${options.data}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 에러 메시지 출력
    print('ERROR MESSAGE => ${err}');

    // 서버 응답이 있는 경우
    if (err.response != null) {
      print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path} HEADER: ${err.requestOptions.headers} DATA: ${err.requestOptions.data}');

      // 특정 상태 코드에 따라 처리
      if (err.response?.statusCode == 400) {
        // 로그인 화면으로 이동.
        navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => Login()));
      }
    } else {
      // 서버 응답이 없을 경우
      print('ERROR: No response received. ${err.requestOptions.path}');
    }

    // 에러 핸들러를 다음으로 진행
    handler.next(err);
  }
}