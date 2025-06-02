// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      message: json['message'] as String,
      cart: (json['cart'] as List<dynamic>)
          .map((e) => Cart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'message': instance.message,
      'cart': instance.cart,
    };

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'product_id': instance.productId,
      'quantity': instance.quantity,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num).toInt(),
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toInt(),
      stock: (json['stock'] as num).toInt(),
      dimension: json['dimension'] as String,
      weight: (json['weight'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      material: json['material'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'stock': instance.stock,
      'dimension': instance.dimension,
      'weight': instance.weight,
      'height': instance.height,
      'material': instance.material,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'images': instance.images,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      id: (json['id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      path: json['path'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'path': instance.path,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
