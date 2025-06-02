import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:insighta/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:insighta/features/auth/sign_up/data/repos/sign_up_repo.dart';

import 'package:insighta/features/auth/sign_up/logic/signup_cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUpRepo _signUpRepo;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  SignupCubit(this._signUpRepo) : super(SignupState.initial());
  void emitSignupStates(SignupRequestBody signupRequestBody) async {
    emit(const SignupState.loading());
    final response = await _signUpRepo.signup(signupRequestBody);
    response.when(success: (signupResponseBody) {
      emit(SignupState.sucess(signupResponse: signupResponseBody));
    }, failure: (error) {
      emit(SignupState.error(error: error.message ?? ''));
    });
  }
}
