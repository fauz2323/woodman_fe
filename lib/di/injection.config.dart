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
import '../module/data/datasource/remote/product_remote_datasource.dart'
    as _i130;
import '../module/data/datasource/remote/user_remote_datasource.dart' as _i611;
import '../module/data/repositories/auth_domain_repository_impl.dart' as _i677;
import '../module/data/repositories/product_domain_repository_impl.dart'
    as _i964;
import '../module/data/repositories/user_domain_repository_impl.dart' as _i485;
import '../module/domain/repository/auth_repository.dart' as _i518;
import '../module/domain/repository/product_repository.dart' as _i284;
import '../module/domain/repository/user_repository.dart' as _i511;
import '../module/domain/usecase/auth/auth_usercase.dart' as _i579;
import '../module/domain/usecase/auth/login_usecase.dart' as _i192;
import '../module/domain/usecase/auth/register_usecase.dart' as _i133;
import '../module/domain/usecase/product/get_product_detail_usecase.dart'
    as _i497;
import '../module/domain/usecase/product/get_product_list_usecase.dart'
    as _i270;
import '../module/domain/usecase/user/get_address_usercase.dart' as _i435;
import '../module/presentation/view/beranda/cubit/beranda_cubit.dart' as _i580;
import '../module/presentation/view/login/cubit/login_cubit.dart' as _i41;
import '../module/presentation/view/product/cubit/product_cubit.dart' as _i707;
import '../module/presentation/view/product_detail/cubit/product_detail_cubit.dart'
    as _i320;
import '../module/presentation/view/profile/cubit/profile_cubit.dart' as _i24;
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
    gh.factory<_i130.ProductRemoteDatasourceImpl>(
        () => _i130.ProductRemoteDatasourceImpl());
    gh.factory<_i558.AuthRemoteDatasourceImpl>(
        () => _i558.AuthRemoteDatasourceImpl());
    gh.factory<_i611.UserRemoteDatasourceImpl>(
        () => _i611.UserRemoteDatasourceImpl());
    gh.factory<_i284.ProductRepository>(() => _i964.ProductDomainRepositoryImpl(
        productRemoteDatasourceImpl: gh<_i130.ProductRemoteDatasourceImpl>()));
    gh.factory<_i518.AuthRepository>(() => _i677.AuthDomainRepositoryImpl(
        authRemoteDatasourceImpl: gh<_i558.AuthRemoteDatasourceImpl>()));
    gh.factory<_i511.UserRepository>(() => _i485.UserDomainRepositoryImpl(
        userRemoteDatasource: gh<_i611.UserRemoteDatasourceImpl>()));
    gh.factory<_i192.LoginUseCase>(
        () => _i192.LoginUseCase(gh<_i518.AuthRepository>()));
    gh.factory<_i579.AuthUsecase>(
        () => _i579.AuthUsecase(gh<_i518.AuthRepository>()));
    gh.factory<_i270.GetProductListUseCase>(
        () => _i270.GetProductListUseCase(gh<_i284.ProductRepository>()));
    gh.factory<_i497.GetProductDetailUsecase>(
        () => _i497.GetProductDetailUsecase(gh<_i284.ProductRepository>()));
    gh.factory<_i320.ProductDetailCubit>(
        () => _i320.ProductDetailCubit(gh<_i497.GetProductDetailUsecase>()));
    gh.factory<_i435.GetAddressUsercase>(
        () => _i435.GetAddressUsercase(gh<_i511.UserRepository>()));
    gh.factory<_i41.LoginCubit>(
        () => _i41.LoginCubit(gh<_i192.LoginUseCase>()));
    gh.factory<_i24.ProfileCubit>(
        () => _i24.ProfileCubit(gh<_i579.AuthUsecase>()));
    gh.factory<_i133.RegisterUsecase>(() =>
        _i133.RegisterUsecase(authRepository: gh<_i518.AuthRepository>()));
    gh.factory<_i614.RegisterCubit>(
        () => _i614.RegisterCubit(gh<_i133.RegisterUsecase>()));
    gh.factory<_i707.ProductCubit>(
        () => _i707.ProductCubit(gh<_i270.GetProductListUseCase>()));
    gh.factory<_i580.BerandaCubit>(
        () => _i580.BerandaCubit(gh<_i270.GetProductListUseCase>()));
    return this;
  }
}
