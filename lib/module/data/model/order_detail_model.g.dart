// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) =>
    OrderDetailModel(
      message: json['message'] as String,
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDetailModelToJson(OrderDetailModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'order': instance.order,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      orderNumber: json['order_number'] as String,
      status: json['status'] as String,
      totalPrice: (json['total_price'] as num).toInt(),
      paymentProof: json['payment_proof'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'order_number': instance.orderNumber,
      'status': instance.status,
      'total_price': instance.totalPrice,
      'payment_proof': instance.paymentProof,
      'items': instance.items,
      'created_at': instance.createdAt,
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
