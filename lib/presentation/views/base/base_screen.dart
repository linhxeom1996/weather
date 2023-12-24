import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseStateScreen<C extends Cubit<S>, S, W extends StatefulWidget>
    extends State<W> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
      body: BlocConsumer<C, S>(
        listenWhen: (pre, cur) => shouldListen(context, cur),
        buildWhen: (previous, current) => shouldBuilder(context, current),
        listener: (context, state) => listener(context, state),
        builder: (context, state) => body(context, state),
      ),
    );
  }

  bool shouldListen(BuildContext context, S current) {
    return false;
  }

  bool shouldBuilder(BuildContext context, S current) {
    return true;
  }

  void listener(BuildContext context, S state) {}

  Widget body(BuildContext context, S state);

  bool resizeToAvoidBottomInset() {
    return true;
  }

  // bool get isLoggedIn => getIt<LoginCubit>().state.isLoginned ?? false;
}

abstract class BaseStateWidget<C extends Cubit<S>, S, W extends StatefulWidget>
    extends State<W> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, S>(
      buildWhen: (previous, current) => shouldBuilder(context, current),
      builder: (context, state) => body(context, state),
    );
  }

  Widget body(BuildContext context, S state);

  bool shouldBuilder(BuildContext context, S current) {
    return true;
  }
}
