import 'package:flutter/material.dart';
import 'package:softbase/presentation/cubits/home/home_cubit.dart';
import 'package:softbase/presentation/cubits/home/home_state.dart';
import 'package:softbase/presentation/views/base/base_screen.dart';
import 'package:softbase/utils/constains/export.dart';
import 'package:softbase/utils/extensions/scroll_controller_extensions.dart';

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
    _scrollController.onScrollEndsLister(() {
      // getNews();
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget body(BuildContext context, state) {
    return const Center(child: Icon(Icons.home, color: ColorApp.black));
  }

  // Future getNews() async {
  //   final homeCubit = BlocProvider.of<HomeCubit>(context);
  //   await homeCubit.getBreakingNewsArticles();
  // }

  // setListSearch(HomeState state) {
  //   BlocProvider.of<SearchCubit>(context).listData = state.articles ?? [];
  // }
}
