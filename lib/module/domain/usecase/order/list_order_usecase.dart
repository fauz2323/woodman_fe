import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/repository/order_repository.dart';

import '../../entities/list_order_entities.dart';

@Injectable()
class ListOrderUseCase {
  final OrderRepository orderRepository;
  ListOrderUseCase(this.orderRepository);

  Future<Either<Failure, List<ListOrderEntities>>> call(String token) async {
    return await orderRepository.orderList(token);
  }
}
