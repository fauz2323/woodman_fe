part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loaded(List products, double totalPrice,
      {@Default(1) int quantity}) = _Loaded;
}
