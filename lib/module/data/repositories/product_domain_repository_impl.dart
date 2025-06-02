import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/add_cart_entities.dart';
import 'package:woodman_project_fe/module/domain/entities/cart_delete_entities.dart';
import 'package:woodman_project_fe/module/domain/entities/cart_entities.dart';
import 'package:woodman_project_fe/module/domain/entities/product_detail_entities.dart';
import 'package:woodman_project_fe/module/domain/entities/product_list_entities.dart';
import 'package:woodman_project_fe/module/domain/repository/product_repository.dart';

import '../datasource/remote/product_remote_datasource.dart';

@Injectable(as: ProductRepository)
class ProductDomainRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasourceImpl productRemoteDatasourceImpl;
  ProductDomainRepositoryImpl({required this.productRemoteDatasourceImpl});

  @override
  Future<Either<Failure, List<ProductListEntities>>> getProductList(
      String token) async {
    final request = await productRemoteDatasourceImpl.getProductList(token);
    return request.fold(
      (l) => Left(l),
      (r) => Right(r.toEntities()),
    );
  }

  @override
  Future<Either<Failure, ProductDetailEntities>> getProductDetail(
      String token, String uuid) async {
    final Request =
        await productRemoteDatasourceImpl.getProductDetail(token, uuid);
    return Request.fold(
      (l) => Left(l),
      (r) => Right(r.toEntities()),
    );
  }

  @override
  Future<Either<Failure, AddCartEntities>> addCard(
      String token, String uuid) async {
    final request = await productRemoteDatasourceImpl.addCard(token, uuid);
    return request.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, List<CartEntities>>> cart(String token) async {
    final request = await productRemoteDatasourceImpl.cart(token);

    return request.fold(
      (left) => Left(Failure(message: left.message, code: left.code)),
      (right) => Right(right.toEntities()),
    );
  }

  @override
  Future<Either<Failure, CartDeleteEntities>> deleteCart(
      String token, String uuid) async {
    final request = await productRemoteDatasourceImpl.deleteCart(token, uuid);
    return request.fold(
      (left) => Left(Failure(message: left.message, code: left.code)),
      (right) => Right(right.toEntity()),
    );
  }
}
