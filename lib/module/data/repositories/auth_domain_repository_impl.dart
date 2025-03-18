import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/data/datasource/remote/auth_remote_datasource.dart';
import 'package:woodman_project_fe/module/domain/entities/register_entities.dart';
import 'package:woodman_project_fe/module/domain/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthDomainRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasourceImpl authRemoteDatasourceImpl;

  AuthDomainRepositoryImpl({required this.authRemoteDatasourceImpl});

  @override
  Future<Either<Failure, RegisterEntities>> register(
      {required String email,
      required String password,
      required String name,
      required String phone}) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
