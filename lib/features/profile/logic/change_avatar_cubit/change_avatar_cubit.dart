import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:insighta/core/helpers/shared_pref_helper.dart';
import 'package:insighta/features/profile/data/models/change_avatar_model.dart';
import 'package:insighta/features/profile/data/models/change_avatar_request.dart';

import 'package:insighta/features/profile/data/repos/change_avatar_repo.dart';
import 'package:insighta/features/profile/logic/change_avatar_cubit/change_avatar_state.dart';

class ChangeAvatarCubit extends Cubit<ChangeAvatarState> {
  final ChangeAvatarRepo _avatarRepo;
  AvatarResponse? userData;
  ChangeAvatarCubit(this._avatarRepo) : super(ChangeAvatarState.initial());

  Future<void> uploadImage(File? newImage) async {
    if (newImage == null) return;

    emit(ChangeAvatarState.loading());
    final request = ChangeAvatarRequest(profileImageUrl: newImage);
    final response = await _avatarRepo.changeAvatar(request);
    response.when(
      success: (avatarResponse) {
        userData = avatarResponse;
        if (avatarResponse.avatarUrl != null) {
          SharedPrefHelper.setData(
            SharedPrefKeys.profileImageUrl,
            avatarResponse.avatarUrl,
          );
        }
        emit(ChangeAvatarState.success(avatarResponse));
      },
      failure: (error) {
        emit(ChangeAvatarState.error(error: error));
      },
    );
  }
}
