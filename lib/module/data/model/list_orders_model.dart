// To parse this JSON data, do
//
//     final listOrdersModel = listOrdersModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:woodman_project_fe/module/domain/entities/list_order_entities.dart';

part 'list_orders_model.g.dart';

ListOrdersModel listOrdersModelFromJson(String str) =>
    ListOrdersModel.fromJson(json.decode(str));

String listOrdersModelToJson(ListOrdersModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ListOrdersModel {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "orders")
  List<Order> orders;

  ListOrdersModel({
    required this.message,
    required this.orders,
  });

  factory ListOrdersModel.fromJson(Map<String, dynamic> json) =>
      _$ListOrdersModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListOrdersModelToJson(this);

  List<ListOrderEntities> toEntity() {
    return orders.map((item) {
      return ListOrderEntities(
        uuid: item.orderNumber,
        imageUrl: '-',
        price: item.totalPrice,
        createdAt: item.createdAt,
        status: item.status,
      );
    }).toList();
  }
}

@JsonSerializable()
class Order {
  @JsonKey(name: "order_number")
  String orderNumber;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "total_price")
  int totalPrice;
  @JsonKey(name: "items")
  List<Item> items;
  @JsonKey(name: "created_at")
  DateTime createdAt;

  Order({
    required this.orderNumber,
    required this.status,
    required this.totalPrice,
    required this.items,
    required this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class Item {
  @JsonKey(name: "product_name")
  String productName;
  @JsonKey(name: "quantity")
  int quantity;
  @JsonKey(name: "price")
  int price;

  Item({
    required this.productName,
    required this.quantity,
    required this.price,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
