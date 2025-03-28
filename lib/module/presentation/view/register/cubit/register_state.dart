part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial(bool activeObsecure) = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.success(String token) = _Success;
  const factory RegisterState.error(String message) = _Error;
}
