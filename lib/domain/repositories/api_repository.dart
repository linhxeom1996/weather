import 'package:softbase/domain/models/reponses/auth_reponse.dart';
import 'package:softbase/domain/models/requests/auth_request.dart';

import '../../utils/resources/data_state.dart';
import '../models/reponses/breaking_news_reponse.dart';
import '../models/requests/breaking_news_request.dart';

abstract class ApiRepository {
  Future<DataState<BreakingNewsReponse>> getBreakingNewsArticles(
      {required BreakingNewsRequest request});

  Future<DataState<LoginReponse>> loginUser(
      {required LoginRequest request});
}
