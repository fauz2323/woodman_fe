import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_order_state.dart';
part 'place_order_cubit.freezed.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit() : super(const PlaceOrderState.initial());
  void toggleBankTransfer(bool value) {
    emit(state.copyWith(bankTransfer: value));
  }

  void toggleWhatsappAdmin(bool value) {
    emit(state.copyWith(whatsappAdmin: value));
  }

  void toggleCashOnDelivery(bool value) {
    emit(state.copyWith(cashOnDelivery: value));
  }
}
