import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:softbase/core/utils/extensions/context_ext.dart';

import '../../core/constants/export.dart';
import '../../core/utils/router/app_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 500), () {
      Navigator.pushReplacementNamed(context, ArchRouters.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: ColorApp.yellow,
        child: GradientText(
          "WeatherNow",
          colors: [
            ColorApp.color4F1,
            ColorApp.color18C.withOpacity(0.7),
          ],
          gradientType: GradientType.linear,
          style: context.myTheme.textThemeT1.body.copyWith(
            fontSize: 38,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
