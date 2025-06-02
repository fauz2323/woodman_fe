part of 'product_detail_cubit.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState.initial() = _Initial;
  const factory ProductDetailState.loaded(
      ProductDetailEntities data, bool buttonStatus) = _Loaded;
  const factory ProductDetailState.error(String message) = _Error;
  const factory ProductDetailState.loading() = _Loading;
  const factory ProductDetailState.unautorize() = _Unautorize;
}
