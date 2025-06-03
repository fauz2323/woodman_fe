// To parse this JSON data, do
//
//     final changePasswordModel = changePasswordModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:woodman_project_fe/module/domain/entities/change_password_entities.dart';

part 'change_password_model.g.dart';

ChangePasswordModel changePasswordModelFromJson(String str) =>
    ChangePasswordModel.fromJson(json.decode(str));

String changePasswordModelToJson(ChangePasswordModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ChangePasswordModel {
  @JsonKey(name: "message")
  String message;

  ChangePasswordModel({
    required this.message,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordModelToJson(this);

  ChangePasswordEntities toEntity() {
    return ChangePasswordEntities(
      message: message,
    );
  }
}
