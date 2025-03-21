import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_order_state.dart';
part 'checkout_order_cubit.freezed.dart';

class CheckoutOrderCubit extends Cubit<CheckoutOrderState> {
  CheckoutOrderCubit() : super(CheckoutOrderState.initial());
}
