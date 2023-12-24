import 'package:flutter/material.dart';

class ColorApp {
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color red = Colors.red;
  static const Color grey = Colors.grey;
  static const Color transparent = Colors.transparent;

  static const Color color1E1 = Color(0xffE1E1E1);
  static const Color color6F6 = Color(0xffF6F6F6);
  static const Color colorF1F = Color(0xff1F1F1F);
  static const Color color18C = Color(0xff6D018C);
  static const Color color333 = Color(0xFF333333);
  static const Color colorD3A = Color(0xFFFB6D3A);
  static const Color colorBF2 = Color(0xFFE7FBF2);
  static const Color colorD2D = Color(0xFF2D2D2D);
  static const Color colorDAD = Color(0xFFADADAD);
  static const Color color4F1 = Color(0xFF15B4F1);
  static const Color colorB22 = Color(0xffD61B22);
  static const Color colorE9E = Color(0xff9E9E9E);

  static Color parseColor(String color) {
    String hex = color.replaceAll("#", "");
    if (hex.isEmpty) hex = "ffffff";
    if (hex.length == 3) {
      hex =
          '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
    }
    Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
    return col;
  }
}
