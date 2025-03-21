import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:woodman_project_fe/core/helper/token_helper.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  initial() async {
    var token = await TokenHelper().getToken();
    await Future.delayed(const Duration(seconds: 3));
    if (token == '-') {
      emit(const SplashState.login());
    } else {
      emit(const SplashState.home());
    }
  }
}
