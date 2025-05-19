// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:woodman_project_fe/module/domain/entities/product_list_entities.dart';

part 'product_model.g.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

@JsonSerializable()
class ProductModel {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "products")
  List<Product> products;

  ProductModel({
    required this.message,
    required this.products,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  List<ProductListEntities> toEntities() => products
      .map(
        (e) => ProductListEntities(
          createdAt: e.createdAt,
          uuid: e.uuid,
          name: e.name,
          description: e.description,
          price: e.price,
          dimension: e.dimension,
          stock: e.stock,
          weight: e.weight,
          height: e.height,
          material: e.material,
          image: e.images.first.path,
        ),
      )
      .toList();
}

@JsonSerializable()
class Product {
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

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
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
