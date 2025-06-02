// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:woodman_project_fe/module/domain/entities/cart_entities.dart';

part 'cart_model.g.dart';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

@JsonSerializable()
class CartModel {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "cart")
  List<Cart> cart;

  CartModel({
    required this.message,
    required this.cart,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);

  List<CartEntities> toEntities() {
    return cart
        .map(
          (data) => CartEntities(
            uuid: data.product.uuid,
            name: data.product.name,
            imageUrl: data.product.images.first.path,
            quantity: data.quantity,
            price: data.quantity * data.product.price,
            description: data.product.description,
          ),
        )
        .toList();
  }
}

@JsonSerializable()
class Cart {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "user_id")
  int userId;
  @JsonKey(name: "product_id")
  int productId;
  @JsonKey(name: "quantity")
  int quantity;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "product")
  Product product;

  Cart({
    required this.id,
    required this.userId,
    required this.productId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
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
