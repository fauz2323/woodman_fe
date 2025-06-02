import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/add_cart_entities.dart';

import '../../repository/product_repository.dart';

@Injectable()
class AddCartUsecase {
  final ProductRepository _productRepository;

  AddCartUsecase(this._productRepository);

  Future<Either<Failure, AddCartEntities>> call(
      String token, String uuid) async {
    return await _productRepository.addCard(token, uuid);
  }
}
