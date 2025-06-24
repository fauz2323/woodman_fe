import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/core/helper/request_helper.dart';
import 'package:woodman_project_fe/module/data/model/list_orders_model.dart';
import 'package:woodman_project_fe/module/data/model/make_order_model.dart';
import 'package:http/http.dart' as http;
import 'package:woodman_project_fe/module/data/model/order_detail_model.dart';

abstract class OrderRemoteDataSource {
  Future<Either<Failure, MakeOrderModel>> makeOrder(String token);
  Future<Either<Failure, ListOrdersModel>> orderList(String token);
  Future<Either<Failure, OrderDetailModel>> orderDetail(
      String token, String orderId);
  Future<Either<Failure, String>> cancelOrder(String token, String orderId);
  Future<Either<Failure, String>> uploadProof(
      String token, String orderId, File imageFile);
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

  @override
  Future<Either<Failure, ListOrdersModel>> orderList(String token) async {
    final request = await http
        .get(
          RequestHelper.orderList,
          headers: RequestHelper.getHeaderGet(token),
        )
        .timeout(
          const Duration(seconds: 10),
          onTimeout: () => RequestHelper.timeOutException(),
        );

    if (request.statusCode == 200) {
      final response = listOrdersModelFromJson(request.body);
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

  @override
  Future<Either<Failure, String>> cancelOrder(String token, String orderId) {
    // TODO: implement cancelOrder
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrderDetailModel>> orderDetail(
      String token, String orderId) async {
    try {
      final body = {
        'order_id': orderId,
      };
      final request = await http
          .post(
            RequestHelper.orderDetail,
            headers: RequestHelper.getHeaderPost(token),
            body: body,
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () => RequestHelper.timeOutException(),
          );

      if (request.statusCode == 200) {
        final response = orderDetailModelFromJson(request.body);
        return Right(response);
      } else {
        return Left(Failure(
            message: 'Failed to get order detail', code: request.statusCode));
      }
    } catch (e) {
      return Left(Failure(message: e.toString(), code: 500));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProof(
      String token, String orderId, File imageFile) async {
    final request = http.MultipartRequest('POST', RequestHelper.uploadProof);
    request.files.add(
      await http.MultipartFile.fromPath(
        'payment_proof',
        imageFile.path,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    request.headers.addAll(RequestHelper.getHeaderPost(token));
    request.fields['order_id'] = orderId;

    final response = await request.send();
    print(response.statusCode);
    print(response.reasonPhrase);
    if (response.statusCode == 200) {
      return Right(response.statusCode.toString());
    } else {
      return Left(Failure(
          message: 'Failed to upload proof', code: response.statusCode));
    }
  }
}
