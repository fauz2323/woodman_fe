import 'package:dartz/dartz.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/register_entities.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterEntities>> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  });
}
