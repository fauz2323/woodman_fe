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
    // Call API
    emit(const RegisterState.success('token'));

    return 'token';
  }
}
