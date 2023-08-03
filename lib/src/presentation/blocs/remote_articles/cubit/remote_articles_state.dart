part of 'remote_articles_cubit.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<Article> articles;
  final bool noMoreDate;
  final DioException? error;

  const RemoteArticlesState({
    this.articles = const [],
    this.noMoreDate = true,
    this.error,
  });

  @override
  List<Object?> get props => [articles, noMoreDate, error];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticlesSuccess extends RemoteArticlesState {
  const RemoteArticlesSuccess({super.articles, super.noMoreDate});
}

class RemoteArticlesFailed extends RemoteArticlesState {
  const RemoteArticlesFailed({super.error});
}
