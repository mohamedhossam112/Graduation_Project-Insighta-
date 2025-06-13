import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:insighta/core/helpers/shared_pref_helper.dart';
import 'package:insighta/features/auth/login/data/models/login_request_body.dart';

import 'package:insighta/features/auth/login/data/repos/login_repo.dart';

import 'package:insighta/features/auth/login/logic/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
          email: emailController.text, password: passwordController.text),
    );
    response.when(success: (loginResponseBody) async {
      await SharedPrefHelper.setData(SharedPrefKeys.isLoggedIn, true);
      emit(LoginState.success(loginResponse: loginResponseBody));
    }, failure: (error) {
      emit(LoginState.error(error: error.message ?? ''));
    });
  }
}
