import 'package:dartz/dartz.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/list_order_entities.dart';
import 'package:woodman_project_fe/module/domain/entities/make_order_entities.dart';

abstract class OrderRepository {
  Future<Either<Failure, MakeOrderEntities>> makeOrder(String token);
  Future<Either<Failure, List<ListOrderEntities>>> orderList(String token);
}
