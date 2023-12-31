
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbase/presentation/cubits/home/home_cubit.dart';
import 'package:softbase/presentation/cubits/home/home_state.dart';
import 'package:softbase/presentation/cubits/search/search_cubit.dart';
import 'package:softbase/presentation/views/base/base_screen.dart';
import 'package:softbase/presentation/views/search/search.dart';
import 'package:softbase/presentation/widgets/list_view_base.dart';
import 'package:softbase/presentation/widgets/loading_base.dart';
import 'package:softbase/utils/extensions/scroll_controller_extensions.dart';

import '../../../domain/models/reponses/articles.dart';

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
      getNews();
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
    switch (state.runtimeType) {
      case HomeLoading:
        return const LoadingWidget();
      case HomeLoadFailed:
        return const FailedWidget();
      case HomeLoadSuccess:
        setListSearch(state);
        break;
      default:
        break;
    }

    return Container(
      color: Colors.pink.withOpacity(0.2),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            const SearchWidget(),
            CustomScrollViewBase(
              controller: _scrollController,
              slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            ArticleWidget(articles: state.articles![index]),
                        childCount: state.articles?.length)),
                if (state.noMoreData == false)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 14, bottom: 32),
                      child: CupertinoActivityIndicator(),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future getNews() async {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    await homeCubit.getBreakingNewsArticles();
  }

  setListSearch(HomeState state) {
    BlocProvider.of<SearchCubit>(context).listData = state.articles ?? [];
  }
}

class ArticleWidget extends StatelessWidget {
  final Articles articles;
  final bool isRemovable;
  final void Function(Articles articles)? onRemove;
  final void Function(Articles articles)? onArticlePressed;

  const ArticleWidget(
      {super.key,
      required this.articles,
      this.isRemovable = false,
      this.onRemove,
      this.onArticlePressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Row(
          children: <Widget>[
            _buildImage(context),
            _buildTitleAndDescription(),
            _buildRemovableArea()
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: double.maxFinite,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.08)),
          child: Image.network(
            articles.urlToImage ?? "",
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return const Center(
                child: Text("404\nNOT FOUND", textAlign: TextAlign.center),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              articles.title ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  articles.description ?? '',
                  maxLines: 2,
                ),
              ),
            ),

            // Datetime
            Row(
              children: [
                const Icon(Icons.timer_outlined, size: 16),
                const SizedBox(width: 4),
                Text(
                  articles.publishedAt ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemovableArea() {
    if (isRemovable) {
      return GestureDetector(
        onTap: _onRemove,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.remove_circle_outline, color: Colors.red),
        ),
      );
    }
    return Container();
  }

  void _onTap() {
    if (onArticlePressed != null) {
      onArticlePressed?.call(articles);
    }
  }

  void _onRemove() {
    if (onRemove != null) {
      onRemove?.call(articles);
    }
  }
}
