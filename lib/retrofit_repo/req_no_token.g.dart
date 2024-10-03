// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req_no_token.dart';

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

AvailableDozzarisResponse _$AvailableDozzarisResponseFromJson(
        Map<String, dynamic> json) =>
    AvailableDozzarisResponse(
      availableDozzaris: (json['availableDozzaris'] as List<dynamic>)
          .map((e) => Dozzari.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AvailableDozzarisResponseToJson(
        AvailableDozzarisResponse instance) =>
    <String, dynamic>{
      'availableDozzaris': instance.availableDozzaris,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _ReqNoToken implements ReqNoToken {
  _ReqNoToken(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    baseUrl ??= '{baseUrl}';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<AvailableDozzarisResponse> getDozzaris() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<AvailableDozzarisResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/dozzaris',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AvailableDozzarisResponse _value;
    try {
      _value = AvailableDozzarisResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
