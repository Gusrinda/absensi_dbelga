import '../../utils/resources/data_state.dart';
import '../models/request/breaking_news_request.dart';
import '../models/response/breaking_news_response.dart';

abstract class ApiRepository {
  Future<DataState<BreakingNewsResponse>> getBreakingNewsArticles(
      {required BreakingNewsRequest request});
}
