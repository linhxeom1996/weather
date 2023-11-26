import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:softbase/domain/models/reponses/articles.dart';

@CopyWith()
abstract class HomeState extends Equatable {
  final List<Articles>? articles;
  final bool? noMoreData;
  final DioException? error;

  const HomeState(
      {this.articles = const [], this.error, this.noMoreData = true});

  @override
  List<Object?> get props => [articles, noMoreData, error];
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoadSuccess extends HomeState {
  const HomeLoadSuccess({super.articles, super.noMoreData});
}

class HomeLoadFailed extends HomeState {
  const HomeLoadFailed({super.error});
}
