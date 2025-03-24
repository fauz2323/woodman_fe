import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/auth_entities.dart';

import '../../repository/auth_repository.dart';

@Injectable()
class AuthUsecase {
  final AuthRepository _authRepository;

  AuthUsecase(this._authRepository);

  Future<Either<Failure, AuthEntities>> auth(String token) async {
    return _authRepository.auth(token: token);
  }
}
