// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeOrderModel _$MakeOrderModelFromJson(Map<String, dynamic> json) =>
    MakeOrderModel(
      message: json['message'] as String,
      orderNumber: json['order_number'] as String,
      totalPrice: json['total_price'] as num,
    );

Map<String, dynamic> _$MakeOrderModelToJson(MakeOrderModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'order_number': instance.orderNumber,
      'total_price': instance.totalPrice,
    };
