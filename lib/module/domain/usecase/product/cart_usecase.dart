import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/cart_entities.dart';
import 'package:woodman_project_fe/module/domain/repository/product_repository.dart';

@Injectable()
class CartUsecase {
  final ProductRepository _productRepository;
  CartUsecase(this._productRepository);

  Future<Either<Failure, List<CartEntities>>> call(String token) async {
    return await _productRepository.cart(token);
  }
}
