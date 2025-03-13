part of 'checkout_order_cubit.dart';

@freezed
class CheckoutOrderState with _$CheckoutOrderState {
  const factory CheckoutOrderState.initial() = _Initial;
  const factory CheckoutOrderState.loading() = _Loading;
  const factory CheckoutOrderState.success() = _Success;
  const factory CheckoutOrderState.error(String message) = _Error;
}
