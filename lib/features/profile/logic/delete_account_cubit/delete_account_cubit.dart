import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:insighta/features/profile/data/models/delete_account_request.dart';
import 'package:insighta/features/profile/data/repos/delete_account_repo.dart';

import 'package:insighta/features/profile/logic/delete_account_cubit/delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteAccountRepo _deleteAccountRepo;
  bool isPasswordHidden = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();

  DeleteAccountCubit(this._deleteAccountRepo)
      : super(const DeleteAccountState.initial());

  void deleteAccount(String password) async {
    emit(const DeleteAccountState.loading());
    final response = await _deleteAccountRepo
        .deleteAccount(DeleteAccountRequest(password: passwordController.text));
    response.when(success: (deleteAccountResponse) async {
      emit(DeleteAccountState.success(
          deleteAccountResponse: deleteAccountResponse));
    }, failure: (error) {
      emit(DeleteAccountState.error(error: error.message ?? ''));
    });
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    return super.close();
  }
}
