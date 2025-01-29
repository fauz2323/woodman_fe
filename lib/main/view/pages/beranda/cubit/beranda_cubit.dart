import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beranda_state.dart';
part 'beranda_cubit.freezed.dart';

class BerandaCubit extends Cubit<BerandaState> {
  BerandaCubit() : super(const BerandaState.initial());
}
