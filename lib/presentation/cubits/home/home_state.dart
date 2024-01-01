import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

@CopyWith()
abstract class HomeState extends Equatable {
  final bool? noMoreData;
  final DioException? error;

  const HomeState(
      {this.error, this.noMoreData = true});

  @override
  List<Object?> get props => [ noMoreData, error];
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoadSuccess extends HomeState {
  const HomeLoadSuccess({ super.noMoreData});
}

class HomeLoadFailed extends HomeState {
  const HomeLoadFailed({super.error});
}
