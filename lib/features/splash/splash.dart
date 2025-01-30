import 'dart:async';

import 'package:flutter/material.dart';
import 'package:softbase/features/widgets/image_widget.dart';

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
    Future.wait([
      fetchInitData(),
    ]).whenComplete(() {
      Timer(const Duration(milliseconds: 500), () {
        Navigator.pushReplacementNamed(context, ArchRouters.home);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            color: ColorApp.color1E1,
            child: ImageWidget(
              asset: IconApp.img_splash,
              width: Dimens().size(context).width / 3,
            ),
          ),
          Container(
            height: Dimens.spacing5,
            width: Dimens().size(context).width / 3,
            margin: const EdgeInsets.only(bottom: Dimens.spacing20),
            decoration: BoxDecoration(
                color: ColorApp.black,
                borderRadius: BorderRadius.circular(Dimens.spacing24)),
          )
        ],
      )),
    );
  }

  Future<bool> fetchInitData() async {
    //fetch init data for app
    return true;
  }
}
