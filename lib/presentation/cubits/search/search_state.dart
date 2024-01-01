import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

@CopyWith()
abstract class SearchState extends Equatable {
  // final List<Articles>? resultSearch;
  final List<String>? recentSearch;
  const SearchState({ this.recentSearch});
  @override
  List<Object?> get props => [ recentSearch];
}

class SearchInit extends SearchState {
  const SearchInit({super.recentSearch});
}

class SearchResultState extends SearchState {
  const SearchResultState();
}
