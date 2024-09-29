// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dozzari.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dozzari _$DozzariFromJson(Map<String, dynamic> json) => Dozzari(
      dozzariId: (json['dozzariId'] as num).toInt(),
      dozzariImageUrl: json['dozzariImageUrl'] as String,
      setInfo: json['setInfo'] as String,
      availableTimes: json['availableTimes'] as String,
    );

Map<String, dynamic> _$DozzariToJson(Dozzari instance) => <String, dynamic>{
      'dozzariId': instance.dozzariId,
      'dozzariImageUrl': instance.dozzariImageUrl,
      'setInfo': instance.setInfo,
      'availableTimes': instance.availableTimes,
    };
