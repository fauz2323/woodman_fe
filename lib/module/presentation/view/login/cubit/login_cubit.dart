import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/helper/regex_helper.dart';
import 'package:woodman_project_fe/module/domain/usecase/auth/login_usecase.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(const LoginState.initial(true));
  final LoginUseCase loginUseCase;

  bool varActiveObsecure = true;

  setObsecure(bool activeObsecure) {
    varActiveObsecure = activeObsecure;
    emit(LoginState.initial(!varActiveObsecure));
  }

  Future<String> login(String email, String password) async {
    if (password.isEmpty || email.isEmpty) {
      return 'Email or Password is empty';
    }

    if (!RegexHelper.isEmailValid(email)) {
      return 'Email is not valid';
    }

    emit(const LoginState.loading());

    final result = await loginUseCase.login(email: email, password: password);
    return result.fold(
      (l) async {
        emit(LoginState.initial(varActiveObsecure));
        return l.message;
      },
      (r) {
        emit(LoginState.success(r.token));
        return "Success Login...";
      },
    );
  }
}
