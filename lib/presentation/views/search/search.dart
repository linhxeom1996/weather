
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libs_text_field/libs_text_field.dart';
import 'package:softbase/app_router.dart';
import 'package:softbase/presentation/views/base/base_screen.dart';
import 'package:softbase/presentation/views/search/search_cubit.dart';
import 'package:softbase/presentation/views/search/search_state.dart';
import 'package:softbase/presentation/widgets/button_base.dart';
import 'package:softbase/presentation/widgets/list_view_base.dart';
import '../../../utils/constains/export.dart';
import '../../widgets/divider_base.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ArchRouters.search);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.spacing10, vertical: Dimens.spacing9),
              margin: const EdgeInsets.symmetric(
                  horizontal: Dimens.spacing15, vertical: Dimens.spacing20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.search_outlined),
                  const SizedBox(width: Dimens.spacing5),
                  const Expanded(
                    child: Text("Tìm kiếm...",
                        style: TextStyle(color: Colors.black)),
                  ),
                  InkWell(
                      onTap: () {
                      },
                      child: const Icon(Icons.camera_alt))
                ],
              ),
            ),
          ),
        ),
        LoginRequiredWidget(
            onTab: () {
              log("go to cart");
            },
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.spacing10, vertical: Dimens.spacing9),
                    child:
                        const Icon(Icons.shopping_cart, color: Colors.black)),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: const Text(
                    "12",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              ],
            ))
      ],
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  String _textSearch = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.pink.withOpacity(0.5),
            padding: const EdgeInsets.fromLTRB(
                Dimens.spacing9, Dimens.spacing15, Dimens.spacing9, Dimens.spacing15),
            child: SafeArea(
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: Dimens.spacing9),
                      height: Dimens.spacing40,
                      width: Dimens.spacing46,
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorApp.white,
                          borderRadius: BorderRadius.circular(Dimens.spacing4)),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: TextFieldBase(
                            controller: _textController,
                            focusNode: _focusNode,
                            hintText: "Search",
                            onBorder: false,
                            height: Dimens.spacing40,
                            onChanged: (value) {
                              BlocProvider.of<SearchCubit>(context)
                                  .searchTitle(text: value);
                              _textSearch = value ?? "";
                            },
                            onEditingComplete: () {
                              BlocProvider.of<SearchCubit>(context)
                                  .saveHistorySearch(_textSearch);
                            },
                          )),
                          Container(
                            height: Dimens.spacing40,
                            color: ColorApp.transparent,
                            padding: const EdgeInsets.symmetric(
                                vertical: Dimens.spacing3, horizontal: Dimens.spacing9),
                            child: Icon(Icons.camera_alt_outlined,
                                color: ColorApp.black.withOpacity(0.6)),
                          ),
                          Container(
                            height: Dimens.spacing32,
                            padding: const EdgeInsets.symmetric(
                                vertical: Dimens.spacing9, horizontal: Dimens.spacing10),
                            margin: const EdgeInsets.all(Dimens.spacing2),
                            decoration: BoxDecoration(
                                color: Colors.pink.withOpacity(0.5),
                                borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(Dimens.spacing3))),
                            child:
                                const Icon(Icons.search, color: ColorApp.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const _ListResult()
        ],
      ),
    );
  }
}

class _ListResult extends StatefulWidget {
  const _ListResult();

  @override
  State<_ListResult> createState() => __ListResultState();
}

class __ListResultState
    extends BaseStateWidget<SearchCubit, SearchState, _ListResult> {
  @override
  bool shouldBuilder(BuildContext context, SearchState current) {
    if (current is SearchResultState || current is SearchInit) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    BlocProvider.of<SearchCubit>(context).getHistorySearch();
    super.initState();
  }

  @override
  Widget body(BuildContext context, state) {
    // var resutlSearch = state.resultSearch;
    // if (resutlSearch != null && resutlSearch.isNotEmpty) {
    //   return ListViewBase(
    //       itemCount: resutlSearch.length,
    //       expanded: true,
    //       builder: (context, index) {
    //         return GestureDetector(
    //           onTap: () {
    //             context
    //                 .read<SearchCubit>()
    //                 .saveHistorySearch(resutlSearch[index].title ?? "");
    //           },
    //           child: Container(
    //             color: ColorApp.transparent,
    //             child: Column(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(
    //                       horizontal: Dimens.sp15, vertical: Dimens.sp7),
    //                   child: Row(
    //                     children: <Widget>[
    //                       Expanded(
    //                         child: Text(
    //                             resutlSearch[index].title ?? "Title empty",
    //                             style: const TextStyle(
    //                                 color: Colors.black,
    //                                 fontSize: Dimens.sp14,
    //                                 overflow: TextOverflow.ellipsis)),
    //                       ),
    //                       const SizedBox(width: Dimens.sp20),
    //                       Container(
    //                         width: Dimens.sp30,
    //                         height: Dimens.sp30,
    //                         color: Colors.red,
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //                 index == resutlSearch.length - 1
    //                     ? Container()
    //                     : const DividerBase()
    //               ],
    //             ),
    //           ),
    //         );
    //       });
    // }
    var history = state.recentSearch;
    if (history != null) {
      return _HistorySearch(history: history);
    }
    return const SizedBox(
      child: Icon(Icons.data_saver_off),
    );
  }
}

class _HistorySearch extends StatelessWidget {
  final List<String> history;
  const _HistorySearch({required this.history});

  @override
  Widget build(BuildContext context) {
    return ListViewBase(
      expanded: false,
      itemCount: history.length,
      builder: (context, index) {
        return Container(
          color: ColorApp.transparent,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.spacing15, vertical: Dimens.spacing7),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(history[index],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: Dimens.spacing14,
                              overflow: TextOverflow.ellipsis)),
                    ),
                    const SizedBox(width: Dimens.spacing20),
                    Container(
                      width: Dimens.spacing30,
                      height: Dimens.spacing30,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              index == history.length - 1 ? Container() : const DividerBase()
            ],
          ),
        );
      },
    );
  }
}

class _SearchSuggestion extends StatelessWidget {
  const _SearchSuggestion();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
