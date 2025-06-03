import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/data/datasource/remote/user_remote_datasource.dart';
import 'package:woodman_project_fe/module/domain/entities/address_entities.dart';
import 'package:woodman_project_fe/module/domain/entities/change_password_entities.dart';
import 'package:woodman_project_fe/module/domain/repository/user_repository.dart';

@Injectable(as: UserRepository)
class UserDomainRepositoryImpl implements UserRepository {
  final UserRemoteDatasourceImpl userRemoteDatasource;

  UserDomainRepositoryImpl({required this.userRemoteDatasource});

  @override
  Future<Either<Failure, AddressEntities>> getAddress(String token) async {
    final request = await userRemoteDatasource.getAddress(token);

    return request.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, AddressEntities>> setAddress(
      String token, AddressEntities data) async {
    final request = await userRemoteDatasource.setAddress(token, data);

    return request.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, ChangePasswordEntities>> changePassword(String token,
      {required String oldPassword, required String newPassword}) async {
    final request = await userRemoteDatasource.changePassword(
      token,
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
    return request.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }
}
