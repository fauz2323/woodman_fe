import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/module/domain/entities/product_list_entities.dart';

import '../../../../core/error/failure_core.dart';
import '../../repository/product_repository.dart';

@Injectable()
class GetProductListUseCase {
  final ProductRepository _productRepository;

  GetProductListUseCase(this._productRepository);

  Future<Either<Failure, List<ProductListEntities>>> call(String token) async {
    return await _productRepository.getProductList(token);
  }
}
