import 'package:flutter/material.dart';
import 'package:libs_text_field/libs_text_field.dart';
import 'package:softbase/features/authentication/presentation/views/otp/otp.dart';

import '../../../../../core/constants/export.dart';
import '../../../../../core/utils/router/app_router.dart';
import '../../../../widgets/button_base.dart';
import '../../widgets/dialog_auth.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextFieldBase(hintText: "Email/phone"),
              const SizedBox(height: Dimens.spacing50),
              ButtonBase(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ArchRouters.otpScreen,
                        arguments: OTPType.forgotPass);
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
        padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const PassTextField(hintText: "new password"),
            const SizedBox(height: Dimens.spacing30),
            const PassTextField(hintText: "new password again"),
            const SizedBox(height: Dimens.spacing50),
            ButtonBase(
                onPressed: () {
                  DialogAuth().changePassFailed(context);
                },
                text: "Confirm",
                backgroundColor: ColorApp.colorB22)
          ],
        ),
      ),
    );
  }
}
