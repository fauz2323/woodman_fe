import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/helper/request_helper.dart';
import 'package:woodman_project_fe/module/data/model/address_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/failure_core.dart';

abstract class UserRemoteDatasource {
  Future<Either<Failure, AddressModel>> getAddress(String token);
  Future<Either<Failure, AddressModel>> setAddress(String token, String uuid);
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
  Future<Either<Failure, AddressModel>> setAddress(String token, String uuid) {
    // TODO: implement setAddress
    throw UnimplementedError();
  }
}
