import 'package:flutter/material.dart';

class DialogBase {
  Future create(BuildContext context,
      {required Widget child,
      bool? barrierDismissible = false,
      Color? barrierColor}) async {
    return showDialog(
        barrierDismissible: barrierDismissible ?? false,
        barrierColor: barrierColor,
        context: context,
        builder: (context) {
          return WillPopScope(onWillPop: () async => false, child: child);
        });
  }
}
