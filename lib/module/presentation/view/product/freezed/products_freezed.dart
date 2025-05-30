import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_freezed.freezed.dart';

@freezed
abstract class ProductsFreezed with _$ProductsFreezed {
  factory ProductsFreezed(
    String name,
    int? age,
  ) = _ProductsFreezed;
}
