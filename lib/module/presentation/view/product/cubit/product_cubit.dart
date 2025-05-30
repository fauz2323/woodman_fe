import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:woodman_project_fe/core/helper/token_helper.dart';
import 'package:woodman_project_fe/module/domain/entities/product_list_entities.dart';
import 'package:woodman_project_fe/module/domain/usecase/product/get_product_list_usecase.dart';

part 'product_cubit.freezed.dart';
part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.getProductListUseCase)
      : super(const ProductState.initial());
  final GetProductListUseCase getProductListUseCase;
  List<ProductListEntities> products = [];
  late String token;

  void loadProducts() async {
    emit(const ProductState.loading());
    token = await TokenHelper().getToken();

    final result = await getProductListUseCase.call(token);

    result.fold(
      (failed) {
        emit(ProductState.error(failed.message));
        if (failed.message == "Unauthorized") {
          emit(const ProductState.unauthorize());
        }
      },
      (success) {
        products = success;
        emit(ProductState.loaded(products));
      },
    );
  }
}
