import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/repository/order_repository.dart';

@Injectable()
class UploadProofUsecase {
  final OrderRepository _orderRepository;

  UploadProofUsecase(this._orderRepository);

  Future<Either<Failure, String>> call(
      String token, String orderId, File image) async {
    return await _orderRepository.uploadProof(token, orderId, image);
  }
}
