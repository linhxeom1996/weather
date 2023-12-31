import 'package:softbase/data/datasources/remote/login_api_service.dart';
import 'package:softbase/domain/models/reponses/auth_reponse.dart';

import 'package:softbase/domain/models/requests/auth_request.dart';

import '../../domain/models/reponses/breaking_news_reponse.dart';
import '../../domain/models/requests/breaking_news_request.dart';
import '../../domain/repositories/api_repository.dart';
import '../../utils/resources/data_state.dart';
import '../datasources/remote/news_api_service.dart';
import 'base/base_api_repository.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final NewsApiService _newsApiService;
  final LoginApiService _loginApiService;
  ApiRepositoryImpl(this._newsApiService, this._loginApiService);

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

  @override
  Future<DataState<LoginReponse>> loginUser({required LoginRequest request}) {
    return getStateOf<LoginReponse>(
        request: () => _loginApiService.loginUser(
              userName: request.username,
              password: request.password,
            ));
  }
}
