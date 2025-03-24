import 'package:dartz/dartz.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/auth_entities.dart';
import 'package:woodman_project_fe/module/domain/entities/login_entities.dart';
import 'package:woodman_project_fe/module/domain/entities/register_entities.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterEntities>> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  });

  Future<Either<Failure, LoginEntities>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthEntities>> auth({
    required String token,
  });
}
