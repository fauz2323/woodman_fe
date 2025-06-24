// To parse this JSON data, do
//
//     final orderDetailModel = orderDetailModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:woodman_project_fe/module/domain/entities/order_detail_entities.dart';

part 'order_detail_model.g.dart';

OrderDetailModel orderDetailModelFromJson(String str) =>
    OrderDetailModel.fromJson(json.decode(str));

String orderDetailModelToJson(OrderDetailModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class OrderDetailModel {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "order")
  Order order;

  OrderDetailModel({
    required this.message,
    required this.order,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailModelToJson(this);

  OrderDetailEntities toEntity() => OrderDetailEntities(
        orderNumber: order.orderNumber,
        status: order.status,
        totalPrice: order.totalPrice,
        paymentProof: order.paymentProof,
        items: order.items
            .map((item) => OrderItemEntities(
                  productName: item.productName,
                  quantity: item.quantity,
                  price: item.price,
                ))
            .toList(),
        createdAt: order.createdAt,
      );
}

@JsonSerializable()
class Order {
  @JsonKey(name: "order_number")
  String orderNumber;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "total_price")
  int totalPrice;
  @JsonKey(name: "payment_proof")
  String paymentProof;
  @JsonKey(name: "items")
  List<Item> items;
  @JsonKey(name: "created_at")
  String createdAt;

  Order({
    required this.orderNumber,
    required this.status,
    required this.totalPrice,
    required this.paymentProof,
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
