import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/make_order_entities.dart';

import '../../repository/order_repository.dart';

@Injectable()
class MakeOrderUsecase {
  final OrderRepository _orderRepository;

  MakeOrderUsecase(this._orderRepository);

  Future<Either<Failure, MakeOrderEntities>> call(String token) async {
    return await _orderRepository.makeOrder(token);
  }
}
