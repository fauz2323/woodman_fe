part of 'beranda_cubit.dart';

@freezed
class BerandaState with _$BerandaState {
  const factory BerandaState.initial() = _Initial;
  const factory BerandaState.loading() = _Loading;
  const factory BerandaState.loaded(List<ProductListEntities> product) =
      _Loaded;
  const factory BerandaState.error() = _Error;
  const factory BerandaState.unauthorized() = _Unauthorized;
}
