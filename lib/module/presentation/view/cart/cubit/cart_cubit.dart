import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/helper/token_helper.dart';
import 'package:woodman_project_fe/module/domain/entities/cart_entities.dart';
import 'package:woodman_project_fe/module/domain/entities/make_order_entities.dart';
import 'package:woodman_project_fe/module/domain/usecase/order/make_order_usecase.dart';
import 'package:woodman_project_fe/module/domain/usecase/product/cart_usecase.dart';
import 'package:woodman_project_fe/module/domain/usecase/product/delete_cart_usecase.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(
    this._cartUsecase,
    this._deleteCartUseCase,
    this._makeOrderUsecase,
  ) : super(const CartState.initial());
  final CartUsecase _cartUsecase;
  final DeleteCartUseCase _deleteCartUseCase;
  final MakeOrderUsecase _makeOrderUsecase;

  final TokenHelper _tokenHelper = TokenHelper();
  late String _token;
  num totalPrice = 0;
  late List<CartEntities> _cartEntities;

  Future<void> loadCart() async {
    emit(const CartState.loading());
    _token = await _tokenHelper.getToken();
    final result = await _cartUsecase(_token);
    result.fold(
      (failure) => emit(CartState.error(failure.message)),
      (products) {
        if (products.isEmpty) {
          emit(const CartState.loaded([], 0));
        } else {
          for (var product in products) {
            totalPrice += product.price * product.quantity;
          }
          _cartEntities = products;
          emit(CartState.loaded(_cartEntities, totalPrice));
        }
      },
    );
  }

  Future<void> deleteCart(String uuid) async {
    emit(const CartState.loading());
    final result = await _deleteCartUseCase(
      token: _token,
      uuid: uuid,
    );

    result.fold(
      (failure) => emit(CartState.error(failure.message)),
      (success) {
        _cartEntities.removeWhere((item) => item.uuid == uuid);
        totalPrice = 0;
        // Recalculate total price after deletion
        for (var product in _cartEntities) {
          totalPrice += product.price * product.quantity;
        }
        print('Cart after deletion: $_cartEntities');
        print('Total price after deletion: $totalPrice');
        emit(CartState.loaded(_cartEntities, totalPrice));
      },
    );
  }

  Future<void> makeOrder() async {
    emit(const CartState.loading());
    _token = await _tokenHelper.getToken();
    final result = await _makeOrderUsecase(_token);

    result.fold(
      (failure) => emit(CartState.error(failure.message)),
      (MakeOrderEntities makeOrderEntities) {
        // Clear the cart after successful order
        _cartEntities.clear();
        emit(CartState.success(makeOrderEntities));
      },
    );
  }
}
