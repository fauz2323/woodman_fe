import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'empty_cart_state.dart';
part 'empty_cart_cubit.freezed.dart';

class EmptyCartCubit extends Cubit<EmptyCartState> {
  EmptyCartCubit() : super(EmptyCartState.initial());
}
