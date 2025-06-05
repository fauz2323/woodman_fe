// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOrdersModel _$ListOrdersModelFromJson(Map<String, dynamic> json) =>
    ListOrdersModel(
      message: json['message'] as String,
      orders: (json['orders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListOrdersModelToJson(ListOrdersModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'orders': instance.orders,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      orderNumber: json['order_number'] as String,
      status: json['status'] as String,
      totalPrice: (json['total_price'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'order_number': instance.orderNumber,
      'status': instance.status,
      'total_price': instance.totalPrice,
      'items': instance.items,
      'created_at': instance.createdAt.toIso8601String(),
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      productName: json['product_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'product_name': instance.productName,
      'quantity': instance.quantity,
      'price': instance.price,
    };
