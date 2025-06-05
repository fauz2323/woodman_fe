import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/helper/token_helper.dart';
import 'package:woodman_project_fe/module/domain/usecase/order/list_order_usecase.dart';

import '../../../../domain/entities/list_order_entities.dart';

part 'order_history_state.dart';
part 'order_history_cubit.freezed.dart';

@injectable
class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit(this._listOrderUseCase)
      : super(const OrderHistoryState.initial());
  final ListOrderUseCase _listOrderUseCase;

  final TokenHelper _tokenHelper = TokenHelper();
  String? token;

  Future<void> fetchOrderHistory() async {
    emit(const OrderHistoryState.loading());
    token = await _tokenHelper.getToken();
    final result = await _listOrderUseCase.call(token!);
    result.fold(
      (failure) => emit(OrderHistoryState.error(failure.message)),
      (orders) {
        emit(OrderHistoryState.loaded(orders));
      },
    );
  }

  Future<void> refreshOrderHistory(String token) async {
    emit(const OrderHistoryState.loading());
    final result = await _listOrderUseCase.call(token);
    result.fold(
      (failure) => emit(OrderHistoryState.error(failure.message)),
      (orders) {
        emit(OrderHistoryState.loaded(orders));
      },
    );
  }
}
