import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/login_entities.dart';

import '../../repository/auth_repository.dart';

@Injectable()
class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<Either<Failure, LoginEntities>> login({
    required String email,
    required String password,
  }) =>
      _authRepository.login(
        email: email,
        password: password,
      );
}
