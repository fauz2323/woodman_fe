part of 'place_order_cubit.dart';

@freezed
class PlaceOrderState with _$PlaceOrderState {
  // loading
  const factory PlaceOrderState.loading() = _Loading;
  // success
  const factory PlaceOrderState.success() = _Success;
  // error
  const factory PlaceOrderState.error(String message) = _Error;

  const factory PlaceOrderState.initial(
      {@Default(false) bool bankTransfer,
      @Default(true) bool whatsappAdmin,
      @Default(false) bool cashOnDelivery}) = _Initial;
  // const factory PlaceOrderState.initial() => const PlaceOrderState(bankTransfer: false, whatsappAdmin: true, cashOnDelivery: true);
}
