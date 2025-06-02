import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/helper/token_helper.dart';
import 'package:woodman_project_fe/module/domain/entities/product_detail_entities.dart';
import 'package:woodman_project_fe/module/domain/usecase/product/add_cart_usecase.dart';
import 'package:woodman_project_fe/module/domain/usecase/product/get_product_detail_usecase.dart';

part 'product_detail_cubit.freezed.dart';
part 'product_detail_state.dart';

@injectable
class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit(this.getProductDetailUsecase, this.addCartUsecase)
      : super(const ProductDetailState.initial());
  final GetProductDetailUsecase getProductDetailUsecase;
  final AddCartUsecase addCartUsecase;
  final TokenHelper _tokenHelper = TokenHelper();
  late String token;
  late ProductDetailEntities productDetail;

  void loadProduct(String uuid) async {
    emit(const ProductDetailState.loading());
    if (uuid.isEmpty) {
      emit(const ProductDetailState.error("Product UUID cannot be empty"));
      return;
    }
    token = await _tokenHelper.getToken();
    final request = await getProductDetailUsecase.call(token, uuid);

    request.fold(
      (failure) => emit(ProductDetailState.error(failure.message)),
      (product) {
        if (product.uuid.isEmpty) {
          emit(const ProductDetailState.error("Product not found"));
        } else {
          productDetail = product;
          emit(ProductDetailState.loaded(productDetail, true));
        }
      },
    );
  }

  Future<String> addCart(String uuid) async {
    emit(const ProductDetailState.loading());
    if (uuid.isEmpty) {
      return "Product UUID cannot be empty";
    }
    token = await _tokenHelper.getToken();
    final request = await addCartUsecase.call(token, uuid);
    return request.fold(
      (failure) {
        emit(ProductDetailState.loaded(productDetail, true));
        return failure.message;
      },
      (success) {
        emit(ProductDetailState.loaded(productDetail, true));
        return "Product added to cart successfully";
      },
    );
  }
}
