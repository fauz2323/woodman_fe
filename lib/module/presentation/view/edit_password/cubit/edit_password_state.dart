part of 'edit_password_cubit.dart';

@freezed
class EditPasswordState with _$EditPasswordState {
  const factory EditPasswordState.initial() = _Initial;
  const factory EditPasswordState.loading() = _Loading;
  const factory EditPasswordState.loaded(ChangePasswordEntities data) = _Loaded;
  const factory EditPasswordState.error(String message) = _Error;
  const factory EditPasswordState.unauthorize(String message) = _Unauthorize;
}
