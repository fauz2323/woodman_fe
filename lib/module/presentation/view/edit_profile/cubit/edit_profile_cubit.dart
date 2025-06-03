import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/helper/token_helper.dart';
import 'package:woodman_project_fe/module/domain/usecase/user/get_address_usercase.dart';
import 'package:woodman_project_fe/module/domain/usecase/user/set_address_usecase.dart';

import '../../../../domain/entities/address_entities.dart';

part 'edit_profile_state.dart';
part 'edit_profile_cubit.freezed.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._getAddressUsercase, this._setAddressUseCase)
      : super(const EditProfileState.initial());

  final GetAddressUsercase _getAddressUsercase;
  final SetAddressUseCase _setAddressUseCase;
  AddressEntities? addressEntities;
  String? token;
  final TokenHelper _tokenHelper = TokenHelper();

  Future<AddressEntities> getAddressUsercase() async {
    emit(const EditProfileState.loading());
    token = await _tokenHelper.getToken();
    print('token: $token');
    final result = await _getAddressUsercase(token!);
    return result.fold<AddressEntities>(
      (failure) {
        emit(EditProfileState.error(failure.message));
        return AddressEntities(
            address: '',
            city: '',
            country: '',
            postalCode: '',
            name: '',
            phone: '');
      },
      (data) {
        addressEntities = data;
        emit(EditProfileState.loaded(data));
        return data;
      },
    );
  }

  Future<AddressEntities> updateAddressUsercase(AddressEntities address) async {
    emit(const EditProfileState.loading());
    token = await _tokenHelper.getToken();
    final result = await _setAddressUseCase(token!, address);
    return result.fold<AddressEntities>(
      (failure) {
        emit(EditProfileState.error(failure.message));
        return AddressEntities(
            address: '',
            city: '',
            country: '',
            postalCode: '',
            name: '',
            phone: '');
      },
      (data) {
        addressEntities = data;
        emit(EditProfileState.loaded(data));
        return data;
      },
    );
  }
}
