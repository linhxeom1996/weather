import 'package:injectable/injectable.dart';
import 'package:softbase/presentation/cubits/base/base_cubit.dart';
import 'package:softbase/presentation/cubits/home/home_state.dart';

import '../../../data/di/injector.dart';
import '../../../domain/models/reponses/articles.dart';
import '../../../domain/models/requests/breaking_news_request.dart';
import '../../../domain/repositories/api_repository.dart';
import '../../../utils/constains/nums.dart';
import '../../../utils/resources/data_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(const HomeLoading());

  final _apiRepository = getIt.get<ApiRepository>();

  int page = 1;
  
  List<Articles> get listArticles => _data;

  final List<Articles> _data = [];

  @factoryMethod
  Future getBreakingNewsArticles() async {
    if (isBusy) return;
    await run(() async {
      final response = await _apiRepository.getBreakingNewsArticles(
          request: BreakingNewsRequest(page: page));

      if (response is DataSuccess) {
        final articles = response.data!.articles;
        final noMoreData = articles!.length < defautPageSize;

        _data.addAll(articles);
        page++;
        emit(HomeLoadSuccess(articles: _data, noMoreData: noMoreData));
      } else if (response is DataFailed) {
        emit(HomeLoadFailed(error: response.error));
      }
    });
  }
}
