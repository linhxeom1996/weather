import 'package:injectable/injectable.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';

import 'home_state.dart';

@singleton
class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(const HomeState());
}
