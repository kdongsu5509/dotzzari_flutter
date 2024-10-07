import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'req_with_token.g.dart';

@RestApi(baseUrl: '{baseUrl}')
abstract class ReqWithToken {
  factory ReqWithToken(Dio dio, {String? baseUrl}) = _ReqWithToken;

  //If you wanna refacotr this code, see the API DOCS 'Page'
  @GET('api/pages/orders/{dozzariId}?start={start}&end={end}')
  Future<OrderPageResponse> getOrderPage(@Path('dozzariId') String dozzariId, @Path('start') String start, @Path('end') String end);

  //OrderPage
  // @POST('/orders')
  // Future<OrderResponse> postOrders(@Body() OrderRequest orderRequest);

  // @GET('/orders?start={start}&end={end}')


}

enum PickUpLocation{
  HOBANWOO,
  PARKING,
  // - HOBANWOO
  // - PARKING
}

@JsonSerializable()
class Additional {
  final String info; // 추가 정보 필드 예시

  Additional({
    required this.info,
  });

  factory Additional.fromJson(Map<String, dynamic> json) =>
      _$AdditionalFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalToJson(this);
}

@JsonSerializable()
class OrderRequest {
  final PickUpLocation pickUpLocation;
  final Additional additional;

  OrderRequest({
    required this.pickUpLocation,
    required this.additional,
  });

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);
}

@JsonSerializable()
class OrderPageResponse {
  final String dozzariId;
  final int price;
  final List<Category> categories;

  OrderPageResponse({
    required this.dozzariId,
    required this.price,
    required this.categories,
  });

  factory OrderPageResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderPageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPageResponseToJson(this);
}

enum CategoryType{
  DEFAULT,
  NECESSARY,
  UNNECESSARY,
}

@JsonSerializable()
class Category {
  final CategoryType categoryType;
  final List<Item> items;

  Category({
    required this.categoryType,
    required this.items,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

enum ItemType{
  DEFAULT,
  RADIO,
  CHECK,
  COUNT,
}

@JsonSerializable()
class Item{
  final int index;
  final String name;
  final int price;
  final ItemType itemType;

  Item({
    required this.index,
    required this.name,
    required this.price,
    required this.itemType,
  });

  factory Item.fromJson(Map<String, dynamic> json) =>
      _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}