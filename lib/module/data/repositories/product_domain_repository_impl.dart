import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/product_list_entities.dart';
import 'package:woodman_project_fe/module/domain/repository/product_repository.dart';

import '../datasource/remote/product_remote_datasource.dart';

@Injectable(as: ProductRepository)
class ProductDomainRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasourceImpl productRemoteDatasourceImpl;
  ProductDomainRepositoryImpl({required this.productRemoteDatasourceImpl});

  @override
  Future<Either<Failure, List<ProductListEntities>>> getProductList(
      String token) async {
    final request = await productRemoteDatasourceImpl.getProductList(token);
    return request.fold(
      (l) => Left(l),
      (r) => Right(r.toEntities()),
    );
  }
}
