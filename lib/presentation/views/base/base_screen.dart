import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbase/data/datasources/local/local_storage.dart';

import '../../../data/di/injector.dart';

abstract class BaseStateScreen<C extends Cubit<S>, S, W extends StatefulWidget>
    extends State<W> {
  final C cubit = getIt<C>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<C, S>(
          builder: (context, state) {
            return WillPopScope(
              onWillPop: onWillPop,
              child: Scaffold(
                resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
                bottomNavigationBar: bottomNavigationBar(context, state),
                appBar: appBar(context, state),
                drawer: drawer(),
                body: body(context, state),
              ),
            );
          },
          listener: (context, state) => listener(context, state),
          listenWhen: (pre, cur) => shouldListen(context, cur),
          buildWhen: (previous, current) => shouldBuilder(context, current)),
    );
  }

  Widget? drawer() => null;

  Future<bool> onWillPop() async => true;

  bool shouldListen(BuildContext context, S current) => false;

  bool shouldBuilder(BuildContext context, S current) => true;

  void listener(BuildContext context, S state) {}

  Widget body(BuildContext context, S state);

  AppBar? appBar(BuildContext context, S state) => null;

  bool resizeToAvoidBottomInset() => true;
  BottomNavigationBar? bottomNavigationBar(BuildContext context, S state) =>
      null;

  LocalStorage get localStorage => getIt.get<LocalStorage>();
}

abstract class BaseStateWidget<C extends Cubit<S>, S, W extends StatefulWidget>
    extends State<W> {
  final C cubit = getIt<C>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<C, S>(
        buildWhen: (previous, current) => shouldBuilder(context, current),
        builder: (context, state) => body(context, state),
        listener: (context, state) => listener(context, state),
        listenWhen: (pre, cur) => shouldListen(context, cur),
      ),
    );
  }

  Widget body(BuildContext context, S state);

  bool shouldListen(BuildContext context, S current) => false;

  bool shouldBuilder(BuildContext context, S current) => true;

  void listener(BuildContext context, S state) {}

  LocalStorage get localStorage => getIt.get<LocalStorage>();
}
