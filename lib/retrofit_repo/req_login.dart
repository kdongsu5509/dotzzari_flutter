import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'req_login.g.dart';

@RestApi(baseUrl: '{baseUrl}')
abstract class ReqLogin {
  factory ReqLogin(Dio dio, {String? baseUrl}) = _ReqLogin;

  @POST('auth/signin')
  Future<Token> signIn(@Body() ReqSignIn reqSignIn);
}

@JsonSerializable()
class Token {
  final String accessToken;
  final String refreshToken;


  Token({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) =>
      _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}

@JsonSerializable()
class ReqSignIn{
  final String email;
  final String provider;

  ReqSignIn({
    required this.email,
    required this.provider,
  });

  factory ReqSignIn.fromJson(Map<String, dynamic> json) =>
      _$ReqSignInFromJson(json);

  Map<String, dynamic> toJson() => _$ReqSignInToJson(this);
}
