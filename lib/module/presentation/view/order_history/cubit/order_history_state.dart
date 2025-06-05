part of 'order_history_cubit.dart';

@freezed
class OrderHistoryState with _$OrderHistoryState {
  const factory OrderHistoryState.initial() = _Initial;
  const factory OrderHistoryState.loading() = _Loading;
  const factory OrderHistoryState.loaded(List<ListOrderEntities> orders) =
      _Loaded;
  const factory OrderHistoryState.error(String message) = _Error;
  const factory OrderHistoryState.empty() = _Empty;
}
