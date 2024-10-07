// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req_with_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Additional _$AdditionalFromJson(Map<String, dynamic> json) => Additional(
      info: json['info'] as String,
    );

Map<String, dynamic> _$AdditionalToJson(Additional instance) =>
    <String, dynamic>{
      'info': instance.info,
    };

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      pickUpLocation:
          $enumDecode(_$PickUpLocationEnumMap, json['pickUpLocation']),
      additional:
          Additional.fromJson(json['additional'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'pickUpLocation': _$PickUpLocationEnumMap[instance.pickUpLocation]!,
      'additional': instance.additional,
    };

const _$PickUpLocationEnumMap = {
  PickUpLocation.HOBANWOO: 'HOBANWOO',
  PickUpLocation.PARKING: 'PARKING',
};

OrderPageResponse _$OrderPageResponseFromJson(Map<String, dynamic> json) =>
    OrderPageResponse(
      dozzariId: json['dozzariId'] as String,
      price: (json['price'] as num).toInt(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderPageResponseToJson(OrderPageResponse instance) =>
    <String, dynamic>{
      'dozzariId': instance.dozzariId,
      'price': instance.price,
      'categories': instance.categories,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      categoryType: $enumDecode(_$CategoryTypeEnumMap, json['categoryType']),
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'categoryType': _$CategoryTypeEnumMap[instance.categoryType]!,
      'items': instance.items,
    };

const _$CategoryTypeEnumMap = {
  CategoryType.DEFAULT: 'DEFAULT',
  CategoryType.NECESSARY: 'NECESSARY',
  CategoryType.UNNECESSARY: 'UNNECESSARY',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      index: (json['index'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      itemType: $enumDecode(_$ItemTypeEnumMap, json['itemType']),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'price': instance.price,
      'itemType': _$ItemTypeEnumMap[instance.itemType]!,
    };

const _$ItemTypeEnumMap = {
  ItemType.DEFAULT: 'DEFAULT',
  ItemType.RADIO: 'RADIO',
  ItemType.CHECK: 'CHECK',
  ItemType.COUNT: 'COUNT',
};

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _ReqWithToken implements ReqWithToken {
  _ReqWithToken(
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
  Future<OrderPageResponse> getOrderPage(
    String dozzariId,
    String start,
    String end,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<OrderPageResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'api/pages/orders/${dozzariId}?start=${start}&end=${end}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrderPageResponse _value;
    try {
      _value = OrderPageResponse.fromJson(_result.data!);
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
