import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../model/product_model.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());

  int quantity = 1;
  double totalPrice = 0;

  void loadProducts() {
    // Simulasi pengambilan data dari API atau database
    final products = [
      ProductModel(
        name: 'Product 1',
        description:
            'Suitable for various rooms, from living room, bedroom, to terrace. Available in a variety of stylish color choices. Soft cushion with premium fabric for extra comfort.',
        dimension: '20x20x30',
        price: 19999.00,
        thumbnailUrl: 'asset/images/sofa.png',
        imageUrl: [],
      ),
      ProductModel(
        name: 'Product 2',
        description:
            'Modern design with high-quality materials. Perfect for small spaces.',
        dimension: '30x30x40',
        price: 29999.00,
        thumbnailUrl: 'asset/images/sofabed.png',
        imageUrl: [],
      ),
    ];

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
