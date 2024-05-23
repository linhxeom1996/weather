import 'package:flutter/material.dart';
import 'package:softbase/presentation/cubits/home/home_cubit.dart';
import 'package:softbase/presentation/cubits/home/home_state.dart';
import 'package:softbase/presentation/views/base/base_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState
    extends BaseStateScreen<HomeCubit, HomeState, HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget body(BuildContext context, state) {
    return const Center();
  }
}
