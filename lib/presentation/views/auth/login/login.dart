import 'package:flutter/material.dart';
import 'package:libs_text_field/libs_text_field.dart';
import 'package:softbase/presentation/cubits/login/login_cubit.dart';
import 'package:softbase/presentation/cubits/login/login_state.dart';
import 'package:softbase/presentation/views/base/base_screen.dart';
import 'package:softbase/presentation/widgets/text_field_base.dart';

import '../../../../utils/constains/export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState
    extends BaseStateScreen<LoginCubit, LoginState, LoginScreen> {
  final TextEditingController userNameController = TextEditingController();

  @override
  Widget body(BuildContext context, LoginState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: Dimens.sp20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PhoneTextField(controller: userNameController),
            const SizedBox(height: Dimens.sp30),
            const TextFieldBase(hintText: "Password")
          ],
        ),
      ),
    );
  }
}
