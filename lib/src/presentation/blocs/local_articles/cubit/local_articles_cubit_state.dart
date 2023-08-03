part of 'local_articles_cubit_cubit.dart';

abstract class LocalArticlesCubitState extends Equatable {
  final List<Article> articles;


  const LocalArticlesCubitState({
    this.articles = const [],
  });

  @override
  List<Object?> get props => [articles];
}

class LocalArticlesLoading extends LocalArticlesCubitState {
  const LocalArticlesLoading();
}

class LocalArticlesSuccess extends LocalArticlesCubitState {
  const LocalArticlesSuccess({super.articles});
}
