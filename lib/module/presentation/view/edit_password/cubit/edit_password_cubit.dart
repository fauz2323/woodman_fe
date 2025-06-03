import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/module/domain/usecase/user/change_password_usecase.dart';

import '../../../../../core/helper/token_helper.dart';
import '../../../../domain/entities/change_password_entities.dart';

part 'edit_password_state.dart';
part 'edit_password_cubit.freezed.dart';

@injectable
class EditPasswordCubit extends Cubit<EditPasswordState> {
  EditPasswordCubit(this._changePasswordUseCase)
      : super(EditPasswordState.loaded(ChangePasswordEntities(message: '')));

  final ChangePasswordUseCase _changePasswordUseCase;
  String? token;
  final TokenHelper _tokenHelper = TokenHelper();

  Future<String> changePassword(String oldPassword, String newPassword) async {
    emit(const EditPasswordState.loading());
    token = await _tokenHelper.getToken();
    final result =
        await _changePasswordUseCase(token!, oldPassword, newPassword);
    return result.fold<String>(
      (failure) {
        emit(EditPasswordState.error(failure.message));
        return failure.message;
      },
      (data) {
        emit(EditPasswordState.loaded(data));
        return data.message;
      },
    );
  }
}
