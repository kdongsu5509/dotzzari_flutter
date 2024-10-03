import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'req_no_token.g.dart';

@RestApi(baseUrl: '{baseUrl}')
abstract class ReqNoToken {
  factory ReqNoToken(Dio dio, {String? baseUrl}) = _ReqNoToken;

  @GET('/dozzaris')
  Future<AvailableDozzarisResponse> getDozzaris();
}

@JsonSerializable()
class Dozzari {
  final int dozzariId;
  final String dozzariImageUrl;
  final String setInfo;
  final String availableTimes;

  Dozzari({
    required this.dozzariId,
    required this.dozzariImageUrl,
    required this.setInfo,
    required this.availableTimes,
  });

  factory Dozzari.fromJson(Map<String, dynamic> json) =>
      _$DozzariFromJson(json);

  Map<String, dynamic> toJson() => _$DozzariToJson(this);
}

@JsonSerializable()
class AvailableDozzarisResponse {
  final List<Dozzari> availableDozzaris;

  AvailableDozzarisResponse({required this.availableDozzaris});

  factory AvailableDozzarisResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailableDozzarisResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableDozzarisResponseToJson(this);
}
