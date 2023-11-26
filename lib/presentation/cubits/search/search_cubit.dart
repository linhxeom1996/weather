import 'package:softbase/data/datasources/local/local_storage.dart';
import 'package:softbase/data/di/injector.dart';
import 'package:softbase/presentation/cubits/base/base_cubit.dart';
import 'package:softbase/presentation/cubits/search/search_state.dart';

import '../../../domain/models/reponses/articles.dart';

class SearchCubit extends BaseCubit<SearchState> {
  SearchCubit() : super(const SearchInit());

  List<Articles> _listData = [];

  set listData(List<Articles> list) {
    _listData = list;
  }

  final _localStorage = getIt.get<LocalStorage>();

  searchTitle({String? text = ""}) {
    if (text == "") {
      getHistorySearch();
    } else {
      if (_listData.isNotEmpty) {
        var result = _listData.where((e) {
          if (e.title != null) {
            return e.title!.toLowerCase().contains(text!.toLowerCase());
          }
          return false;
        }).toList();
        emit(SearchResultState(resultSearch: result));
      } else {
        emit(const SearchResultState(resultSearch: []));
      }
    }
  }

  saveHistorySearch(String value) {
    if (value != "") {
      var listLocal = _localStorage.historySearch;
      if (!listLocal.contains(value)) {
        listLocal.add(value);
        _localStorage.setHistorySearch(listLocal);
      }
    }
  }

  getHistorySearch() {
    var listLocal = _localStorage.historySearch.reversed.toList();
    emit(SearchInit(recentSearch: listLocal));
  }
}
