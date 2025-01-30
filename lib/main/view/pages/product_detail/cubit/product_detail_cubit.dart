import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:woodman_project_fe/model/product_model.dart';

part 'product_detail_cubit.freezed.dart';
part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(const ProductDetailState.initial());

  void loadProduct() {
    var product = ProductModel(
      name: 'Product',
      description:
          'Suitable for various rooms, from living room, bedroom, to terrace, Available in a variety of stylish color choices, Soft cushion with premium fabric for extra comfort, Suitable for various rooms, from living room, bedroom, to terrace, Available in a variety of stylish color choices, Soft cushion with premium fabric for extra comfort,',
      dimension: '20x20x30',
      price: 19999.00,
      thumbnailUrl: '',
      imageUrl: [
        'asset/images/chair.png',
        'asset/images/sofa.png',
        'asset/images/sofabed.png',
        'asset/images/chair.png',
      ],
    );

    emit(ProductDetailState.loaded(product));
  }
}
