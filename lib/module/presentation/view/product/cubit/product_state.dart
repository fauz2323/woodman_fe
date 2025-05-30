part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loaded(List<ProductListEntities> products) =
      _Loaded;

  const factory ProductState.error(String message) = _Error;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.unauthorize() = _Unauthorize;
}
