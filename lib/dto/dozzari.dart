import 'package:json_annotation/json_annotation.dart';

part 'dozzari.g.dart';

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