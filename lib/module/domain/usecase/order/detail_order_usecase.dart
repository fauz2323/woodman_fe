import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/order_detail_entities.dart';
import 'package:woodman_project_fe/module/domain/repository/order_repository.dart';

@Injectable()
class DetailOrderUsecase {
  final OrderRepository orderRepository;

  DetailOrderUsecase(this.orderRepository);

  Future<Either<Failure, OrderDetailEntities>> call(
      String token, String orderId) async {
    return await orderRepository.detailOrder(token, orderId);
  }
}
