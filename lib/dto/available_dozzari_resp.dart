import 'package:json_annotation/json_annotation.dart';

import 'dozzari.dart';

part 'available_dozzari_resp.g.dart';

@JsonSerializable()
class AvailableDozzariResp {
  final int status;
  final String message;
  final List<Dozzari> data;

  AvailableDozzariResp({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AvailableDozzariResp.fromJson(Map<String, dynamic> json) =>
      _$AvailableDozzariRespFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableDozzariRespToJson(this);
}
