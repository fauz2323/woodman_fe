import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/product_detail_entities.dart';

import '../../repository/product_repository.dart';

@Injectable()
class GetProductDetailUsecase {
  final ProductRepository _productRepository;

  GetProductDetailUsecase(this._productRepository);

  Future<Either<Failure, ProductDetailEntities>> call(
      String token, String uuid) async {
    return await _productRepository.getProductDetail(token, uuid);
  }
}
