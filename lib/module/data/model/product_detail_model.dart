// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'product_detail_model.g.dart';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ProductDetailModel {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "detail")
  Detail detail;

  ProductDetailModel({
    required this.message,
    required this.detail,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailModelToJson(this);
}

@JsonSerializable()
class Detail {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "uuid")
  String uuid;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "price")
  int price;
  @JsonKey(name: "stock")
  int stock;
  @JsonKey(name: "dimension")
  String dimension;
  @JsonKey(name: "weight")
  int weight;
  @JsonKey(name: "height")
  int height;
  @JsonKey(name: "material")
  String material;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "images")
  List<Image> images;

  Detail({
    required this.id,
    required this.uuid,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.dimension,
    required this.weight,
    required this.height,
    required this.material,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  Map<String, dynamic> toJson() => _$DetailToJson(this);
}

@JsonSerializable()
class Image {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "product_id")
  int productId;
  @JsonKey(name: "path")
  String path;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  Image({
    required this.id,
    required this.productId,
    required this.path,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
