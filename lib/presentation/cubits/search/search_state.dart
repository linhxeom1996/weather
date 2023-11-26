import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:softbase/domain/models/reponses/articles.dart';

@CopyWith()
abstract class SearchState extends Equatable {
  final List<Articles>? resultSearch;
  final List<String>? recentSearch;
  const SearchState({this.resultSearch = const [], this.recentSearch});
  @override
  List<Object?> get props => [resultSearch, recentSearch];
}

class SearchInit extends SearchState {
  const SearchInit({super.recentSearch});
}

class SearchResultState extends SearchState {
  const SearchResultState({super.resultSearch});
}
