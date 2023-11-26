

import '../../../utils/constains/nums.dart';
import '../../../utils/constains/strings.dart';

class BreakingNewsRequest {
  final String? apiKey;
  final String? sources;
  final int? page;
  final int? pageSize;

  BreakingNewsRequest(
      {this.apiKey = defaultApiKey,
      this.page = 1,
      this.pageSize = defautPageSize,
      this.sources = 'bbc-news, abc-news'});
}
