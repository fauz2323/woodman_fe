import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:woodman_project_fe/model/product_model.dart';

part 'product_cubit.freezed.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState.initial());
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
      ProductModel(
        name: 'Product 3',
        description:
            'Elegant and comfortable sofa bed. Easy to transform from sofa to bed.',
        dimension: '40x40x50',
        price: 39999.00,
        thumbnailUrl: 'asset/images/sofa.png',
        imageUrl: [],
      ),
      ProductModel(
        name: 'Product 1',
        description:
            'Suitable for various rooms, from living room, bedroom, to terrace. Available in a variety of stylish color choices. Soft cushion with premium fabric for extra comfort.',
        dimension: '20x20x30',
        price: 19999.00,
        thumbnailUrl: 'asset/images/sofa.png',
        imageUrl: [],
      ),
    ];

    emit(ProductState.loaded(products));
  }
}
