import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_state.dart';
part 'edit_profile_cubit.freezed.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(const EditProfileState.initial());
}
