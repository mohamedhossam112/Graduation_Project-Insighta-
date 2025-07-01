import 'dart:io';

import 'package:bloc/bloc.dart';


import 'package:insighta/features/profile/data/repos/change_avatar_repo.dart';
import 'package:insighta/features/profile/logic/change_avatar_cubit/change_avatar_state.dart';

class ChangeAvatarCubit extends Cubit<ChangeAvatarState> {
  final ChangeAvatarRepo _avatarRepo;
  ChangeAvatarCubit(this._avatarRepo) : super(ChangeAvatarState.initial());

  Future<void> uploadImage(File file) async {
    emit(ChangeAvatarState.loading());

    final response = await _avatarRepo.changeAvatar(file);
    response.when(
      success: (avatarResponse) {
        emit(ChangeAvatarState.success(avatarResponse));
      },
      failure: (error) {
        emit(ChangeAvatarState.error(error: error));
      },
    );
  }
}
