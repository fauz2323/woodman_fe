import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/change_password_entities.dart';

import '../../repository/user_repository.dart';

@Injectable()
class ChangePasswordUseCase {
  final UserRepository _userRepository;

  ChangePasswordUseCase(this._userRepository);

  Future<Either<Failure, ChangePasswordEntities>> call(
      String token, String oldPassword, String newPassword) async {
    return await _userRepository.changePassword(token,
        newPassword: newPassword, oldPassword: oldPassword);
  }
}
