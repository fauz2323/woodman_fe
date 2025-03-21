import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_cubit.freezed.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState.initial());
  void loadProducts() {
    // Simulasi pengambilan data dari API atau database
    final products = [];

    emit(ProductState.loaded(products));
  }
}
