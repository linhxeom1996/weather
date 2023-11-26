import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbase/data/datasources/local/local_storage.dart';
import 'package:softbase/data/di/injector.dart';
import 'package:softbase/presentation/cubits/home/home_cubit.dart';
import 'package:softbase/utils/constains/dimens.dart';

import '../../../config/routes/app_router.dart';
import '../../../utils/constains/colors.dart';
import '../../../utils/constains/icon.dart';
import '../../widgets/image_widget.dart';

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
        Navigator.pushReplacementNamed(
            context,
            !getIt.get<LocalStorage>().isFirstOpen
                ? ArchRouters.home
                : ArchRouters.intro);
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
            height: Dimens.sp5,
            width: Dimens().size(context).width / 3,
            margin: const EdgeInsets.only(bottom: Dimens.sp20),
            decoration: BoxDecoration(
                color: ColorApp.black,
                borderRadius: BorderRadius.circular(Dimens.sp24)),
          )
        ],
      )),
    );
  }

  Future<bool> fetchInitData() async {
    //fetch init data for app
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    await homeCubit.getBreakingNewsArticles();
    return true;
  }
}
