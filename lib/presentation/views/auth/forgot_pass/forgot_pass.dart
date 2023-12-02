import 'package:flutter/material.dart';
import 'package:libs_text_field/libs_text_field.dart';
import 'package:softbase/config/routes/app_router.dart';
import 'package:softbase/presentation/widgets/button_base.dart';

import '../../../../utils/constains/export.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ForgotScreen Page"),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: Dimens.sp20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextFieldBase(hintText: "Email/phone"),
              const SizedBox(height: Dimens.sp50),
              ButtonBase(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ArchRouters.otpScreen);
                  },
                  text: "Send OTP",
                  backgroundColor: ColorApp.colorB22)
            ],
          )),
    );
  }
}

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New pass"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: Dimens.sp20),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFieldBase(hintText: "new password"),
            SizedBox(height: Dimens.sp30),
            TextFieldBase(hintText: "new password again"),
          ],
        ),
      ),
    );
  }
}
