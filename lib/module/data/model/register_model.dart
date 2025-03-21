// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:woodman_project_fe/module/domain/entities/register_entities.dart';

part 'register_model.g.dart';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

@JsonSerializable()
class RegisterModel {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "token")
  final String token;

  RegisterModel({
    required this.message,
    required this.token,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);

  RegisterEntities toEntities() => RegisterEntities(token: token);
}
