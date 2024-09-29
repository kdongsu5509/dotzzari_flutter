// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_dozzari_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableDozzariResp _$AvailableDozzariRespFromJson(
        Map<String, dynamic> json) =>
    AvailableDozzariResp(
      status: (json['status'] as num).toInt(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Dozzari.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AvailableDozzariRespToJson(
        AvailableDozzariResp instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
