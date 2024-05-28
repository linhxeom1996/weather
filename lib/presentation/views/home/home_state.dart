import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'home_state.g.dart';

@CopyWith()
class HomeState extends Equatable {
  final bool? noMoreData;
  final DioException? error;

  const HomeState({this.error, this.noMoreData = true});

  @override
  List<Object?> get props => [noMoreData, error];
}
