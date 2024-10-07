import 'package:dotzzari/common/dozzari_flexible_size.dart';
import 'package:dotzzari/dozzari_stroage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../retrofit_repo/custom_dio.dart';
import '../retrofit_repo/req_login.dart';
import '../secret/dozzari_secret.dart';

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
                  'asset/image/dozzari_tumyeong_logo.png'),
              SizedBox(height: dheight(context, 0.2)),
              GestureDetector(
                onTap: () async {
                  await kakaoLogin();
                },
                child: Image.asset('asset/image/kakao.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//카카오 인가 코드 요청 ->
Future<void> kakaoLogin() async {
  List<String> serviceTerms = ['account_email'];

  //1. 먼저 카카오 로그인 시도.
  OAuthToken token;
  if (await isKakaoTalkInstalled()) {
    try {
      token = await UserApi.instance.loginWithKakaoTalk(serviceTerms: serviceTerms);
      printUserInfo(token);
      print('카카오톡으로 로그인 성공');
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');

      // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (error is PlatformException && error.code == 'CANCELED') {
        return;
      }
      // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
      try {
        token = await UserApi.instance.loginWithKakaoAccount(serviceTerms: serviceTerms);
        printUserInfo(token);
        print('카카오계정으로 로그인 성공');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  } else {
    try {
      token = await UserApi.instance.loginWithKakaoAccount(serviceTerms: serviceTerms);
      printUserInfo(token);
      print('카카오계정으로 로그인 성공');
    } catch (error) {
      print('카카오계정으로 로그인 실패 $error');
    }
  }
}

void printUserInfo(
  OAuthToken token,
) async {
  User user;
  try {
    user = await UserApi.instance.me();
  } catch (error) {
    print('사용자 정보 요청 실패 $error');
    return;
  }
  //token은 위에서 받아온다.
  try {
    user = await UserApi.instance.me();
    if(user.kakaoAccount?.email == null){
      print('이메일이 없습니다.');
      throw Exception('이메일이 없습니다.');
    }
    print('사용자 정보 요청 성공'
        '\n회원번호: ${user.id}'
        '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
        '\n이메일: ${user.kakaoAccount?.email}');
  } catch (error) {
    print('사용자 정보 요청 실패 $error');
  }

  final client = ReqLogin(customDio, baseUrl: baseUrl);

  ReqSignIn reqSignIn = ReqSignIn(email: (user.kakaoAccount?.email)!, provider: 'KAKAO');

  client.signIn(reqSignIn).then((value) {

    dozzariStorage.write(key : 'accessToken', value : value.accessToken);
    dozzariStorage.write(key : 'refreshToken', value : value.refreshToken);

    print('ACCESS : ${value.accessToken} \n REFRESH : ${value.refreshToken}');
  });
}
