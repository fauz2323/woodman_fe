// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:woodman_project_fe/module/domain/entities/address_entities.dart';

part 'address_model.g.dart';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

@JsonSerializable()
class AddressModel {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "address")
  String address;
  @JsonKey(name: "city")
  String city;
  @JsonKey(name: "country")
  String country;
  @JsonKey(name: "postal_code")
  String postalCode;

  AddressModel({
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    required this.country,
    required this.postalCode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  AddressEntities toEntity() {
    return AddressEntities(
      name: name,
      phone: phone,
      address: address,
      city: city,
      country: country,
      postalCode: postalCode,
    );
  }
}
