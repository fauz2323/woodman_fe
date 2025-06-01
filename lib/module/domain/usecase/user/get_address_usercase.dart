import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/error/failure_core.dart';
import 'package:woodman_project_fe/module/domain/entities/address_entities.dart';
import 'package:woodman_project_fe/module/domain/repository/user_repository.dart';

@Injectable()
class GetAddressUsercase {
  final UserRepository _getAddressRepository;

  GetAddressUsercase(this._getAddressRepository);

  Future<Either<Failure, AddressEntities>> call(String token) async {
    return await _getAddressRepository.getAddress(token);
  }
}
