
import '../../domain/models/reponses/breaking_news_reponse.dart';
import '../../domain/models/requests/breaking_news_request.dart';
import '../../domain/repositories/api_repository.dart';
import '../../utils/resources/data_state.dart';
import '../datasources/remote/news_api_service.dart';
import 'base/base_api_repository.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final NewsApiService _newsApiService;
  ApiRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<BreakingNewsReponse>> getBreakingNewsArticles(
      {required BreakingNewsRequest request}) {
    return getStateOf<BreakingNewsReponse>(
        request: () => _newsApiService.getBreakingNewsArticles(
            apiKey: request.apiKey,
            sources: request.sources,
            page: request.page,
            pageSize: request.pageSize));
  }
}
