import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:woodman_project_fe/core/helper/token_helper.dart';
import 'package:woodman_project_fe/module/domain/entities/order_detail_entities.dart';
import 'package:woodman_project_fe/module/domain/usecase/order/detail_order_usecase.dart';
import 'package:woodman_project_fe/module/domain/usecase/order/upload_proof_usecase.dart';

part 'transaction_detail_state.dart';
part 'transaction_detail_cubit.freezed.dart';

@injectable
class TransactionDetailCubit extends Cubit<TransactionDetailState> {
  TransactionDetailCubit(this._detailOrderUsecase, this._uploadProofUsecase)
      : super(const TransactionDetailState.initial());

  final DetailOrderUsecase _detailOrderUsecase;
  final UploadProofUsecase _uploadProofUsecase;

  final TokenHelper _tokenHelper = TokenHelper();
  late String token;
  File? image;
  late OrderDetailEntities orderDetailEntities;

  initialLoading(String orderId) async {
    emit(const TransactionDetailState.loading());
    var statusPermission = await Permission.photos.status;

    if (statusPermission.isProvisional || statusPermission.isDenied) {
      await Permission.photos.request();
      statusPermission = await Permission.photos.status;

      if (statusPermission.isDenied) {
        emit(const TransactionDetailState.error(
            'Gallery permission is required to upload proof of payment'));
        return;
      }
    }

    if (statusPermission.isGranted) {
      token = await _tokenHelper.getToken();
      final result = await _detailOrderUsecase(token, orderId);
      result.fold(
        (failure) => emit(TransactionDetailState.error(failure.message)),
        (data) {
          orderDetailEntities = data;
          emit(TransactionDetailState.loaded(data, image));
        },
      );
    }
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(TransactionDetailState.loaded(orderDetailEntities, image));
    }
  }

  Future<void> uploadImage() async {
    emit(const TransactionDetailState.loading());
    final result = await _uploadProofUsecase(
        token, orderDetailEntities.orderNumber, image!);
    result.fold(
      (failure) => emit(TransactionDetailState.error(failure.message)),
      (data) async {
        final result =
            await _detailOrderUsecase(token, orderDetailEntities.orderNumber);
        result.fold(
          (failure) => emit(TransactionDetailState.error(failure.message)),
          (data) {
            orderDetailEntities = data;
            emit(TransactionDetailState.loaded(orderDetailEntities, image));
          },
        );
      },
    );
  }
}
