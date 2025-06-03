import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/address_entities.dart';

import '../../repository/user_repository.dart';

@Injectable()
class SetAddressUseCase {
  final UserRepository _userRepository;

  SetAddressUseCase(this._userRepository);

  Future<Either<Failure, AddressEntities>> call(
      String token, AddressEntities data) async {
    return await _userRepository.setAddress(token, data);
  }
}
