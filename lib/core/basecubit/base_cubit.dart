import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbase/core/local_storage/local_storage.dart';

import '../di/injector.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  BaseCubit(S initialState) : super(initialState);

  LocalStorage get localStorage => getIt.get<LocalStorage>();

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  Future<void> run(Future<void> Function() process) async {
    if (!_isBusy) {
      _isBusy = true;
      await process();
      _isBusy = false;
    }
  }
}
