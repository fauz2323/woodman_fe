// To parse this JSON data, do
//
//     final deleteCartModel = deleteCartModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:woodman_project_fe/module/domain/entities/cart_delete_entities.dart';

part 'delete_cart_model.g.dart';

DeleteCartModel deleteCartModelFromJson(String str) =>
    DeleteCartModel.fromJson(json.decode(str));

String deleteCartModelToJson(DeleteCartModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class DeleteCartModel {
  @JsonKey(name: "message")
  String message;

  DeleteCartModel({
    required this.message,
  });

  factory DeleteCartModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCartModelToJson(this);

  CartDeleteEntities toEntity() {
    return CartDeleteEntities(
      message: message,
    );
  }
}
