import 'package:dartz/dartz.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/product_list_entities.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductListEntities>>> getProductList(
      String token);
}
