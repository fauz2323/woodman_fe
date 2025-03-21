import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_order_state.dart';
part 'review_order_cubit.freezed.dart';

class ReviewOrderCubit extends Cubit<ReviewOrderState> {
  ReviewOrderCubit() : super(const ReviewOrderState.initial());
}
