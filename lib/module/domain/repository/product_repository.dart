import 'package:dartz/dartz.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/cart_delete_entities.dart';
import 'package:woodman_project_fe/module/domain/entities/cart_entities.dart';
import 'package:woodman_project_fe/module/domain/entities/product_detail_entities.dart';
import 'package:woodman_project_fe/module/domain/entities/product_list_entities.dart';

import '../entities/add_cart_entities.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductListEntities>>> getProductList(
      String token);
  Future<Either<Failure, ProductDetailEntities>> getProductDetail(
      String token, String uuid);
  Future<Either<Failure, AddCartEntities>> addCard(String token, String uuid);
  Future<Either<Failure, List<CartEntities>>> cart(String token);
  Future<Either<Failure, CartDeleteEntities>> deleteCart(
      String token, String uuid);
}
