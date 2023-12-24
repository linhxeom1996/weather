import 'package:flutter/material.dart';
import 'package:softbase/presentation/widgets/button_base.dart';
import 'package:softbase/presentation/widgets/dialog_base.dart';

import '../../../../utils/constains/export.dart';

class DialogAuth {
  Future loginFailed(BuildContext context) async {
    return DialogBase().create(context,
        child: Dialog(
          child: Container(
            color: ColorApp.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text("Login failed"),
                const SizedBox(height: Dimens.sp10),
                const Text("Email or password incorrect"),
                ButtonBase(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  text: "Ok",
                  backgroundColor: ColorApp.red,
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.sp20, vertical: Dimens.sp10),
                )
              ],
            ),
          ),
        ));
  }
}
