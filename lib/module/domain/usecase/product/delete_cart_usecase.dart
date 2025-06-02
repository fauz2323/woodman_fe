import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/cart_delete_entities.dart';

import '../../repository/product_repository.dart';

@Injectable()
class DeleteCartUseCase {
  final ProductRepository _productRepository;

  DeleteCartUseCase(this._productRepository);

  Future<Either<Failure, CartDeleteEntities>> call(
      {required String token, required String uuid}) async {
    return await _productRepository.deleteCart(token, uuid);
  }
}
