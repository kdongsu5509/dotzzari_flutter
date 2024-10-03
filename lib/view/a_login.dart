import 'package:dio/dio.dart';
import 'package:dotzzari/common/dozzari_flexible_size.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../retrofit_repo/req_no_token.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                width: dwidth(context, 0.5),
                'asset/image/dozzari_tumyeong_logo.png'
              ),
              SizedBox(height: dheight(context, 0.2)),
              Image.asset(
                'asset/image/kakao.png'
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Future<void> kakaoLogin() async{
  if(await isKakaoTalkInstalled()){
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      print('카카오톡으로 로그인 성공 ${token.accessToken}');
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }
  }else{
    try {
      await AuthCodeClient.instance.authorize(
        redirectUri: 'kakao://oauth',
      );
    } catch (error) {
      print('카카오계정으로 로그인 실패 $error');
    }
  }
}