part of 'empty_cart_cubit.dart';

@freezed
class EmptyCartState with _$EmptyCartState {
  const factory EmptyCartState.initial() = _Initial;
  const factory EmptyCartState.loading() = _Loading;
  const factory EmptyCartState.error(String message) = _Error;
}
