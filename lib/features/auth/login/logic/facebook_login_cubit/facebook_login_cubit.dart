import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:insighta/features/auth/login/logic/facebook_login_cubit/facebook_login_state.dart';

class FacebookLoginCubit extends Cubit<FacebookLoginState> {
  FacebookLoginCubit() : super(const FacebookLoginState.initial());

  Future<void> loginWithoutBackend(
      {void Function(Map<String, dynamic>)? onSuccessNavigate}) async {
    emit(const FacebookLoginState.loading());

    try {
      final result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.instance.getUserData(
          fields: "name,email,picture.width(200)",
        );

        emit(FacebookLoginState.success(userData));

        // ✅ نفّذ التنقيل لو فيه Callback
        if (onSuccessNavigate != null) {
          onSuccessNavigate(userData);
        }
      } else {
        emit(const FacebookLoginState.error('Login Failed!'));
      }
    } catch (e) {
      emit(FacebookLoginState.error(e.toString()));
    }
  }
}
