part of 'product_detail_cubit.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState.initial() = _Initial;
  const factory ProductDetailState.loaded(ProductModel product) = _Loaded;
}
