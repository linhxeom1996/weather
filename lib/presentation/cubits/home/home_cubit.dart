import 'package:softbase/presentation/cubits/base/base_cubit.dart';
import 'package:softbase/presentation/cubits/home/home_state.dart';

import '../../../data/di/injector.dart';
import '../../../data/repositories/network/api_repository_impl.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(const HomeLoading());

  final _apiRepository = getIt.get<ApiRepository>();

  int page = 1;

  Future getBreakingNewsArticles() async {
    if (isBusy) return;
    await run(() async {});
  }
}
