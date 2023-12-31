import 'package:flutter/material.dart';

class KeyboardDetect {
  void unfocusKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  void requestFocus(FocusNode focusNode) => focusNode.requestFocus();
}
