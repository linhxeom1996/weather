import '../../utils/resources/data_state.dart';
import '../models/reponses/breaking_news_reponse.dart';
import '../models/requests/breaking_news_request.dart';

abstract class ApiRepository {
  Future<DataState<BreakingNewsReponse>> getBreakingNewsArticles(
      {required BreakingNewsRequest request});
}
