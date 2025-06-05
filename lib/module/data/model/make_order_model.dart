// To parse this JSON data, do
//
//     final makeOrderModel = makeOrderModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:woodman_project_fe/module/domain/entities/make_order_entities.dart';

part 'make_order_model.g.dart';

MakeOrderModel makeOrderModelFromJson(String str) =>
    MakeOrderModel.fromJson(json.decode(str));

String makeOrderModelToJson(MakeOrderModel data) => json.encode(data.toJson());

@JsonSerializable()
class MakeOrderModel {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "order_number")
  String orderNumber;
  @JsonKey(name: "total_price")
  num totalPrice;

  MakeOrderModel({
    required this.message,
    required this.orderNumber,
    required this.totalPrice,
  });

  factory MakeOrderModel.fromJson(Map<String, dynamic> json) =>
      _$MakeOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$MakeOrderModelToJson(this);

  MakeOrderEntities toEntity() =>
      MakeOrderEntities(orderId: orderNumber, price: totalPrice);
}
