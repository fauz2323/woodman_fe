import 'package:dartz/dartz.dart';
import 'package:woodman_project_fe/module/domain/entities/address_entities.dart';

import '../../../core/error/failure_core.dart';

abstract class UserRepository {
  Future<Either<Failure, AddressEntities>> getAddress(String token);
  Future<Either<Failure, AddressEntities>> setAddress(
      String token, AddressEntities data);
}
