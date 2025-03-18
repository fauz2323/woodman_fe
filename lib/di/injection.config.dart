// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../module/data/datasource/remote/auth_remote_datasource.dart' as _i558;
import '../module/data/repositories/auth_domain_repository_impl.dart' as _i677;
import '../module/domain/repository/auth_repository.dart' as _i518;
import '../module/domain/usecase/auth/register_usecase.dart' as _i133;
import '../module/presentation/view/register/cubit/register_cubit.dart'
    as _i614;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i558.AuthRemoteDatasourceImpl>(
        () => _i558.AuthRemoteDatasourceImpl());
    gh.factory<_i518.AuthRepository>(() => _i677.AuthDomainRepositoryImpl(
        authRemoteDatasourceImpl: gh<_i558.AuthRemoteDatasourceImpl>()));
    gh.factory<_i133.RegisterUsecase>(() =>
        _i133.RegisterUsecase(authRepository: gh<_i518.AuthRepository>()));
    gh.factory<_i614.RegisterCubit>(
        () => _i614.RegisterCubit(gh<_i133.RegisterUsecase>()));
    return this;
  }
}
