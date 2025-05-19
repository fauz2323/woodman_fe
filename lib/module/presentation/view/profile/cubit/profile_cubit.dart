import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/helper/token_helper.dart';
import 'package:woodman_project_fe/module/domain/entities/auth_entities.dart';
import 'package:woodman_project_fe/module/domain/usecase/auth/auth_usercase.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.authUsecase) : super(const ProfileState.loading());
  final AuthUsecase authUsecase;
  final TokenHelper tokenHelper = TokenHelper();
  late String token;

  Future<String> logout() async {
    emit(const ProfileState.loading());
    await TokenHelper().deleteAllToken();
    await Future.delayed(const Duration(seconds: 1));
    return 'Logout';
  }

  Future initial() async {
    token = await tokenHelper.getToken();
    emit(const ProfileState.loading());
    final result = await authUsecase.auth(token);
    result.fold(
      (l) => emit(ProfileState.error(l.message)),
      (r) => emit(ProfileState.loaded(r)),
    );
  }
}
