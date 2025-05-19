import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/helper/token_helper.dart';
import 'package:woodman_project_fe/module/domain/entities/product_list_entities.dart';
import 'package:woodman_project_fe/module/domain/usecase/product/get_product_list_usecase.dart';

part 'beranda_state.dart';
part 'beranda_cubit.freezed.dart';

@injectable
class BerandaCubit extends Cubit<BerandaState> {
  BerandaCubit(this.getProductListUseCase)
      : super(const BerandaState.loading());
  final GetProductListUseCase getProductListUseCase;
  TokenHelper tokenHelper = TokenHelper();
  late String token;

  initial() async {
    token = await tokenHelper.getToken();
    final request = await getProductListUseCase.call(token);
    request.fold(
      (l) => emit(const BerandaState.error()),
      (r) => emit(BerandaState.loaded(r)),
    );
  }
}
