part of 'transaction_detail_cubit.dart';

@freezed
class TransactionDetailState with _$TransactionDetailState {
  const factory TransactionDetailState.initial() = _Initial;
  const factory TransactionDetailState.loading() = _Loading;
  const factory TransactionDetailState.loaded(
      OrderDetailEntities data, File? image) = _Loaded;
  const factory TransactionDetailState.error(String message) = _Error;
}
