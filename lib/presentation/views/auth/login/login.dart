import 'package:flutter/material.dart';
import 'package:libs_text_field/libs_text_field.dart';
import 'package:softbase/app_router.dart';
import 'package:softbase/presentation/views/auth/widgets/dialog_auth.dart';
import 'package:softbase/presentation/views/base/base_screen.dart';
import 'package:softbase/presentation/widgets/button_base.dart';
import 'package:softbase/presentation/widgets/list_view_base.dart';
import 'package:softbase/utils/extensions/keyboard_dectect.dart';

import '../../../../utils/constains/export.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState
    extends BaseStateScreen<LoginCubit, LoginState, LoginScreen> {
  final TextEditingController userNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget body(BuildContext context, LoginState state) {
    var sizeScreen = Dimens().size(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing20),
        child: ScrollConfiguration(
          behavior: OverScrollCus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: sizeScreen.height / 4),
                PhoneTextField(
                    controller: userNameController),
                const SizedBox(height: Dimens.spacing30),
                const PassTextField(
                    hintText: "Password"),
                const SizedBox(height: Dimens.spacing5),
                Container(
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  child: TextButtonBase(
                    text: "Forgot password?",
                    onTab: () {
                      KeyboardDetect().unfocusKeyboard();
                      Navigator.of(context).pushNamed(ArchRouters.forgotScreen);
                    },
                  ),
                ),
                const SizedBox(height: Dimens.spacing30),
                ButtonBase(
                    onPressed: () {
                      KeyboardDetect().unfocusKeyboard();
                      DialogAuth().loginFailed(context);
                    },
                    text: "Login Pressed",
                    backgroundColor: ColorApp.colorB22),
                SizedBox(height: sizeScreen.height / 4),
                GestureDetector(
                  onTap: () {
                    KeyboardDetect().unfocusKeyboard();
                    Navigator.of(context).pushNamed(ArchRouters.register);
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Don't have account? ",
                        style: Theme.of(context).textTheme.bodyMedium),
                    TextSpan(
                        text: "Register?",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: ColorApp.colorB22)),
                  ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
