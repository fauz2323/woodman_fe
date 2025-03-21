part of 'review_order_cubit.dart';

@freezed
class ReviewOrderState with _$ReviewOrderState {
  const factory ReviewOrderState.initial() = _Initial;
  const factory ReviewOrderState.loading() = _Loading;
  const factory ReviewOrderState.success() = _Success;
  const factory ReviewOrderState.error(String message) = _Error;
}
