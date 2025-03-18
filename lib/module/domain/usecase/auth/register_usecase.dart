import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/register_entities.dart';
import 'package:woodman_project_fe/module/domain/repository/auth_repository.dart';

@Injectable()
class RegisterUsecase {
  final AuthRepository authRepository;

  RegisterUsecase({required this.authRepository});

  Future<Either<Failure, RegisterEntities>> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) =>
      authRepository.register(
        email: email,
        password: password,
        name: name,
        phone: phone,
      );
}
