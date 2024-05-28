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
                const SizedBox(height: Dimens.spacing10),
                const Text("Email or password incorrect"),
                ButtonBase(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: "Ok",
                  backgroundColor: ColorApp.red,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.spacing20, vertical: Dimens.spacing10),
                )
              ],
            ),
          ),
        ));
  }

  Future registerSuccess(BuildContext context) async {
    return DialogBase().create(context,
        child: Dialog(
          child: Container(
            color: ColorApp.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text("Register sucess"),
                const SizedBox(height: Dimens.spacing10),
                ButtonBase(
                  onPressed: () {
                    Navigator.of(context)
                      ..pop()
                      ..pop()
                      ..pop();
                  },
                  text: "Ok",
                  backgroundColor: ColorApp.red,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.spacing20, vertical: Dimens.spacing10),
                )
              ],
            ),
          ),
        ));
  }

  Future registerFailed(BuildContext context) async {
    return DialogBase().create(context,
        child: Dialog(
          child: Container(
            color: ColorApp.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text("Register failed"),
                const SizedBox(height: Dimens.spacing10),
                ButtonBase(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: "Ok",
                  backgroundColor: ColorApp.red,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.spacing20, vertical: Dimens.spacing10),
                )
              ],
            ),
          ),
        ));
  }

  Future changePassSuccess(BuildContext context) async {
    return DialogBase().create(context,
        child: Dialog(
          child: Container(
            color: ColorApp.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text("Change password success"),
                const SizedBox(height: Dimens.spacing10),
                ButtonBase(
                  onPressed: () {
                    Navigator.of(context)
                      ..pop()
                      ..pop()
                      ..pop()
                      ..pop();
                  },
                  text: "Ok",
                  backgroundColor: ColorApp.red,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.spacing20, vertical: Dimens.spacing10),
                )
              ],
            ),
          ),
        ));
  }

  Future changePassFailed(BuildContext context) async {
    return DialogBase().create(context,
        child: Dialog(
          child: Container(
            color: ColorApp.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text("Change password failed"),
                const SizedBox(height: Dimens.spacing10),
                ButtonBase(
                  onPressed: () {
                    Navigator.of(context)
                      ..pop()
                      ..pop()
                      ..pop();
                  },
                  text: "Ok",
                  backgroundColor: ColorApp.red,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.spacing20, vertical: Dimens.spacing10),
                )
              ],
            ),
          ),
        ));
  }
}
