import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/helper/request_helper.dart';
import 'package:woodman_project_fe/module/data/model/address_model.dart';
import 'package:http/http.dart' as http;
import 'package:woodman_project_fe/module/data/model/change_password_model.dart';
import 'package:woodman_project_fe/module/domain/entities/address_entities.dart';

import '../../../../core/error/failure_core.dart';

abstract class UserRemoteDatasource {
  Future<Either<Failure, AddressModel>> getAddress(String token);
  Future<Either<Failure, AddressModel>> setAddress(
      String token, AddressEntities data);
  Future<Either<Failure, ChangePasswordModel>> changePassword(
    String token, {
    required String oldPassword,
    required String newPassword,
  });
}

@Injectable()
class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  @override
  Future<Either<Failure, AddressModel>> getAddress(String token) async {
    final request = await http
        .get(
      RequestHelper.getAddress,
      headers: RequestHelper.getHeaderGet(token),
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return RequestHelper.timeOutException();
      },
    );

    if (request.statusCode == 200) {
      return Right(AddressModel.fromJson(json.decode(request.body)));
    } else {
      return Left(Failure(message: request.body, code: request.statusCode));
    }
  }

  @override
  Future<Either<Failure, AddressModel>> setAddress(
      String token, AddressEntities data) async {
    Map body = {
      "name": data.name,
      "phone": data.phone,
      "address": data.address,
      "city": data.city,
      "country": data.country,
      "postal_code": data.postalCode,
    };

    final request = await http
        .post(
      RequestHelper.setAddress,
      headers: RequestHelper.getHeaderPost(token),
      body: body,
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return RequestHelper.timeOutException();
      },
    );

    if (request.statusCode == 200) {
      return Right(AddressModel.fromJson(json.decode(request.body)));
    } else {
      return Left(Failure(message: request.body, code: request.statusCode));
    }
  }

  @override
  Future<Either<Failure, ChangePasswordModel>> changePassword(String token,
      {required String oldPassword, required String newPassword}) async {
    Map body = {
      "old_password": oldPassword,
      "new_password": newPassword,
    };
    final request = await http
        .post(
      RequestHelper.editPassword,
      headers: RequestHelper.getHeaderPost(token),
      body: body,
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return RequestHelper.timeOutException();
      },
    );
    if (request.statusCode == 200) {
      return Right(ChangePasswordModel.fromJson(json.decode(request.body)));
    } else {
      return Left(Failure(message: request.body, code: request.statusCode));
    }
  }
}
