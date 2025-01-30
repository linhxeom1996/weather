import 'package:injectable/injectable.dart';
import 'package:softbase/core/basecubit/base_cubit.dart';

import 'home_state.dart';

@singleton
class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(const HomeState());
}
