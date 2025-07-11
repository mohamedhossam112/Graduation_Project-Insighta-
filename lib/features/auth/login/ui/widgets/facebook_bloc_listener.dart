import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insighta/core/routing/routes.dart';
import 'package:insighta/features/auth/login/logic/facebook_login_cubit/facebook_login_cubit.dart';
import 'package:insighta/features/auth/login/logic/facebook_login_cubit/facebook_login_state.dart';

class FacebookLoginBlocListener extends StatelessWidget {
  const FacebookLoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FacebookLoginCubit, FacebookLoginState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          },
          success: (userData) {
            Navigator.of(context).pop();
            Navigator.pushReplacementNamed(
                context, Routes.navBarScreen); // remove loading
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Facebook Logged in Successfuly!")),
            );
          },
          error: (message) {
            Navigator.of(context).pop(); // remove loading
            Navigator.pushReplacementNamed(context, Routes.navBarScreen);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
