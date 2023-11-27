import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbase/presentation/cubits/login/login_cubit.dart';
import 'package:softbase/presentation/cubits/login/login_state.dart';
import 'package:softbase/presentation/views/base/base_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState
    extends BaseStateScreen<LoginCubit, LoginState, LoginScreen> {
  @override
  Widget body(BuildContext context, LoginState state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login Page",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<LoginCubit>().login();
                },
                child: const Text(
                  "Login Press",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w400),
                ))
          ],
        ),
      ),
    );
  }
}
