import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:softbase/config/routes/app_router.dart';
import 'package:softbase/presentation/views/auth/otp/widgets/pinput_widget.dart';
import 'package:softbase/presentation/widgets/button_base.dart';

import '../../../../utils/constains/export.dart';

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
            const PinputWidget(),
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
