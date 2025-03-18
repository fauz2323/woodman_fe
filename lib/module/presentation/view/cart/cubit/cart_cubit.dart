import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());

  int quantity = 1;
  double totalPrice = 0;

  void loadProducts() {
    // Simulasi pengambilan data dari API atau database
    final products = [];

    // Hitung total harga awal
    totalPrice = products.fold(0, (sum, product) => sum + product.price);
    emit(
        CartState.loaded(products, totalPrice)); // quantity otomatis bernilai 1
  }

  void increaseQuantity() {
    quantity++;
    _updateTotalPrice();
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
      _updateTotalPrice();
    }
  }

  void _updateTotalPrice() {
    final state = this.state;
    if (state is _Loaded) {
      totalPrice = state.products
          .fold(0, (sum, product) => sum + (product.price * quantity));
      emit(state.copyWith(totalPrice: totalPrice, quantity: quantity));
    }
  }
}
