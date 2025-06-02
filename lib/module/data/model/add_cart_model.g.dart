// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCartModel _$AddCartModelFromJson(Map<String, dynamic> json) => AddCartModel(
      message: json['message'] as String,
      cart: Cart.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddCartModelToJson(AddCartModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'cart': instance.cart,
    };

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      userId: (json['user_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'user_id': instance.userId,
      'product_id': instance.productId,
      'quantity': instance.quantity,
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
    };
