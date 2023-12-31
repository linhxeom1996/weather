import 'package:flutter/material.dart';
import 'package:libs_text_field/libs_text_field.dart';
import 'package:softbase/presentation/views/auth/otp/otp.dart';
import 'package:softbase/presentation/widgets/button_base.dart';
import 'package:softbase/presentation/widgets/divider_base.dart';
import 'package:softbase/presentation/widgets/list_view_base.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../utils/constains/export.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: Dimens.sp20),
        color: ColorApp.white,
        child: ScrollViewBase(
            child: Column(
          children: <Widget>[
            const SizedBox(height: Dimens.sp20),
            TextFieldBase(
                hintText: "Email/phone", controller: _userNameController),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimens.sp15),
              child: PassTextField(
                  hintText: "Password", controller: _passController),
            ),
            PassTextField(
                hintText: "Password again", controller: _confirmPassController),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimens.sp20),
              child: ButtonBase(
                onPressed: () {
                  Navigator.of(context).pushNamed(ArchRouters.otpScreen,
                      arguments: OTPType.register);
                },
                text: "Register",
                backgroundColor: ColorApp.red,
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Row(
                children: <Widget>[
                  Expanded(
                    child: DividerBase(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimens.sp10),
                    child: Text("or"),
                  ),
                  Expanded(
                    child: DividerBase(),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Have a account? ",
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: "Login?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: ColorApp.colorB22)),
              ])),
            )
          ],
        )),
      ),
    );
  }
}
