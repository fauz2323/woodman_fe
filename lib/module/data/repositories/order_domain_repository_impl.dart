import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/data/datasource/remote/order_remote_datasource.dart';
import 'package:woodman_project_fe/module/domain/entities/make_order_entities.dart';
import 'package:woodman_project_fe/module/domain/repository/order_repository.dart';

@Injectable(as: OrderRepository)
class OrderDomainRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSourceImpl _orderRemoteDataSource;

  OrderDomainRepositoryImpl(this._orderRemoteDataSource);

  @override
  Future<Either<Failure, MakeOrderEntities>> makeOrder(String token) async {
    final result = await _orderRemoteDataSource.makeOrder(token);
    return result.fold(
      (failure) => Left(failure),
      (makeOrderModel) => Right(makeOrderModel.toEntity()),
    );
  }
}
