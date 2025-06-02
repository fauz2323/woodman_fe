// To parse this JSON data, do
//
//     final addCartModel = addCartModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:woodman_project_fe/module/domain/entities/add_cart_entities.dart';

part 'add_cart_model.g.dart';

AddCartModel addCartModelFromJson(String str) =>
    AddCartModel.fromJson(json.decode(str));

String addCartModelToJson(AddCartModel data) => json.encode(data.toJson());

@JsonSerializable()
class AddCartModel {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "cart")
  Cart cart;

  AddCartModel({
    required this.message,
    required this.cart,
  });

  factory AddCartModel.fromJson(Map<String, dynamic> json) =>
      _$AddCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddCartModelToJson(this);

  AddCartEntities toEntity() {
    return AddCartEntities(
      message: message,
      quantity: cart.quantity,
    );
  }
}

@JsonSerializable()
class Cart {
  @JsonKey(name: "user_id")
  int userId;
  @JsonKey(name: "product_id")
  int productId;
  @JsonKey(name: "quantity")
  int quantity;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "id")
  int id;

  Cart({
    required this.userId,
    required this.productId,
    required this.quantity,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
