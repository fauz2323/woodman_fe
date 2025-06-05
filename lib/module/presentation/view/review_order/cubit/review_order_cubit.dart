import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/helper/token_helper.dart';
import 'package:woodman_project_fe/module/domain/entities/address_entities.dart';
import 'package:woodman_project_fe/module/domain/usecase/order/make_order_usecase.dart';
import 'package:woodman_project_fe/module/domain/usecase/user/get_address_usercase.dart';

import '../../../argument/checkout.argument.dart';

part 'review_order_state.dart';
part 'review_order_cubit.freezed.dart';

@injectable
class ReviewOrderCubit extends Cubit<ReviewOrderState> {
  ReviewOrderCubit(this._getAddressUsercase, this._makeOrderUsecase)
      : super(const ReviewOrderState.initial());
  final GetAddressUsercase _getAddressUsercase;
  final MakeOrderUsecase _makeOrderUsecase;
  final TokenHelper _tokenHelper = TokenHelper();
  String? token;

  Future<void> getAddress(CheckOutArgument data) async {
    emit(const ReviewOrderState.loading());
    token = await _tokenHelper.getToken();
    final result = await _getAddressUsercase.call(token!);
    result.fold(
      (failure) => emit(ReviewOrderState.error(failure.message)),
      (address) => emit(ReviewOrderState.loaded(address, data)),
    );
  }

  Future<void> makeOrder() async {
    emit(const ReviewOrderState.loading());
    token = await _tokenHelper.getToken();
    final result = await _makeOrderUsecase.call(token!);
    result.fold(
      (failure) => emit(ReviewOrderState.error(failure.message)),
      (_) => emit(const ReviewOrderState.success()),
    );
  }
}
