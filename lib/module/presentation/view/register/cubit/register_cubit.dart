import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/module/domain/usecase/auth/register_usecase.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUsecase)
      : super(const RegisterState.initial(true));

  final RegisterUsecase registerUsecase;

  setObsecure(bool activeObsecure) {
    emit(RegisterState.initial(!activeObsecure));
  }

  Future<String> register({
    required String email,
    required String phone,
    required String firstName,
    required String lastName,
    required String password,
    required String confirmPassword,
  }) async {
    emit(const RegisterState.loading());

    if (password != confirmPassword) {
      emit(const RegisterState.initial(true));
      return 'Password not match!!!';
    }

    // Call API
    final request = await registerUsecase.register(
      email: email,
      name: '$firstName $lastName',
      password: password,
      phone: phone,
    );

    return request.fold(
      (l) {
        emit(const RegisterState.initial(true));
        return l.message;
      },
      (r) {
        var token = r.token;
        emit(RegisterState.success(token));
        return 'Success Register';
      },
    );
  }
}
