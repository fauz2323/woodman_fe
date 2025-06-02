import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/module/data/model/add_cart_model.dart';
import 'package:woodman_project_fe/module/data/model/cart_model.dart';
import 'package:woodman_project_fe/module/data/model/delete_cart_model.dart';
import 'package:woodman_project_fe/module/data/model/product_detail_model.dart';
import 'package:woodman_project_fe/module/data/model/product_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/failure_core.dart';
import '../../../../core/helper/request_helper.dart';

abstract class ProductRemoteDatasource {
  Future<Either<Failure, ProductModel>> getProductList(String token);
  Future<Either<Failure, ProductDetailModel>> getProductDetail(
      String token, String uuid);
  Future<Either<Failure, AddCartModel>> addCard(String token, String uuid);
  Future<Either<Failure, CartModel>> cart(String token);
  Future<Either<Failure, DeleteCartModel>> deleteCart(
      String token, String uuid);
}

@Injectable()
class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  @override
  Future<Either<Failure, ProductModel>> getProductList(String token) async {
    final request = await http
        .get(
      RequestHelper.productList,
      headers: RequestHelper.getHeaderGet(token),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return RequestHelper.timeOutException();
    });

    print("statusCode is ${request.body}");

    if (request.statusCode == 200) {
      return Right(ProductModel.fromJson(json.decode(request.body)));
    } else {
      return Left(Failure(message: request.body, code: request.statusCode));
    }
  }

  @override
  Future<Either<Failure, ProductDetailModel>> getProductDetail(
      String token, String uuid) async {
    // TODO: implement getProductDetail
    Map body = {
      "uuid": uuid,
    };
    final request = await http
        .post(
      RequestHelper.productDetail,
      body: body,
      headers: RequestHelper.getHeaderPost(token),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return RequestHelper.timeOutException();
    });

    print("statusCode is ${request.body}");

    if (request.statusCode == 200) {
      return Right(ProductDetailModel.fromJson(json.decode(request.body)));
    } else {
      return Left(Failure(message: request.body, code: request.statusCode));
    }
  }

  @override
  Future<Either<Failure, AddCartModel>> addCard(
      String token, String uuid) async {
    Map body = {
      "uuid": uuid,
    };
    final request = await http
        .post(
      RequestHelper.addCart,
      body: body,
      headers: RequestHelper.getHeaderPost(token),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return RequestHelper.timeOutException();
    });

    if (request.statusCode == 200) {
      return Right(AddCartModel.fromJson(json.decode(request.body)));
    } else {
      return Left(Failure(message: request.body, code: request.statusCode));
    }
  }

  @override
  Future<Either<Failure, CartModel>> cart(String token) async {
    final request = await http
        .get(
      RequestHelper.cart,
      headers: RequestHelper.getHeaderGet(token),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return RequestHelper.timeOutException();
    });

    if (request.statusCode == 200) {
      return Right(CartModel.fromJson(json.decode(request.body)));
    } else {
      return Left(Failure(message: request.body, code: request.statusCode));
    }
  }

  @override
  Future<Either<Failure, DeleteCartModel>> deleteCart(
      String token, String uuid) async {
    Map body = {
      "uuid": uuid,
    };
    final request = await http
        .post(
      RequestHelper.deleteCart,
      body: body,
      headers: RequestHelper.getHeaderPost(token),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return RequestHelper.timeOutException();
    });
    if (request.statusCode == 200) {
      return Right(DeleteCartModel.fromJson(json.decode(request.body)));
    } else {
      return Left(Failure(message: request.body, code: request.statusCode));
    }
  }
}
