import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../retrofit_repo/req_no_token.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Text('Login'),
            ),
            ElevatedButton(onPressed: (){}, child: Text('KAKAOLOGIN')),
          ],
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