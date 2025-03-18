import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:http/http.dart' as http;
import 'package:woodman_project_fe/core/helper/request_helper.dart';
import 'package:woodman_project_fe/module/data/model/register_model.dart';
import 'dart:convert';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, String>> login(String email, String password);
  Future<Either<Failure, RegisterModel>> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  });
  Future<Either<Failure, String>> auth(String token);
}

@Injectable()
class AuthRemoteDatasourceImpl implements AuthRemoteDataSource {
  @override
  Future<Either<Failure, String>> auth(String token) async {
    final request = await http
        .get(
      RequestHelper.auth,
      headers: RequestHelper.getHeaderGet(token),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return RequestHelper.timeOutException();
    });

    if (request.statusCode == 200) {
      return Right(request.body);
    } else {
      return Left(Failure(message: request.body, code: request.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> login(String email, String password) async {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RegisterModel>> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    Map body = {
      "email": email,
      "password": password,
      "name": name,
      "phone": phone,
    };

    final request = await http
        .post(
      RequestHelper.register,
      headers: RequestHelper.getHeaderPost(''),
      body: body,
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return RequestHelper.timeOutException();
    });

    if (request.statusCode == 200) {
      return Right(RegisterModel.fromJson(json.decode(request.body)));
    } else {
      return Left(Failure(message: request.body, code: request.statusCode));
    }
  }
}
