import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../core/constants/export.dart';
import '../../../../../core/utils/router/app_router.dart';
import '../../../../widgets/button_base.dart';
import '../../widgets/pinput_widget.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as OTPType;

    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Page"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("otp send to:"),
            PinputWidget(
              onDone: (value) {},
              timeOutListener: () {},
              timeOutPressed: () {},
            ),
            ButtonBase(
                onPressed: () {
                  switch (args) {
                    case OTPType.forgotPass:
                      Navigator.of(context).pushNamed(ArchRouters.newPassword);
                      break;
                    case OTPType.register:
                      log("register success");
                      break;
                  }
                },
                text: "Continue",
                backgroundColor: ColorApp.colorB22),
          ],
        ),
      ),
    );
  }
}

enum OTPType { forgotPass, register }
