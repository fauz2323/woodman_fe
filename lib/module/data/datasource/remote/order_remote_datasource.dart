import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/core/helper/request_helper.dart';
import 'package:woodman_project_fe/module/data/model/make_order_model.dart';
import 'package:http/http.dart' as http;

abstract class OrderRemoteDataSource {
  Future<Either<Failure, MakeOrderModel>> makeOrder(String token);
}

@Injectable()
class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  @override
  Future<Either<Failure, MakeOrderModel>> makeOrder(String token) async {
    final request = await http
        .get(
          RequestHelper.makeOrder,
          headers: RequestHelper.getHeaderGet(token),
        )
        .timeout(
          const Duration(seconds: 10),
          onTimeout: () => RequestHelper.timeOutException(),
        );

    if (request.statusCode == 200) {
      final response = makeOrderModelFromJson(request.body);
      return Right(response);
    } else {
      return Left(
        Failure(
          message: jsonDecode(request.body)['message'] ?? 'Unknown error',
          code: request.statusCode,
        ),
      );
    }
  }
}
