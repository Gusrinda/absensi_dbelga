import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/models/response/article.dart';
import '../../../../domain/repositories/database_repository.dart';

part 'local_articles_cubit_state.dart';

class LocalArticlesCubit extends Cubit<LocalArticlesCubitState> {

  final DatabaseRepository _databaseRepository;

  LocalArticlesCubit(this._databaseRepository) : super(const LocalArticlesLoading());

  Future<void> getAllSavedArticles() async {
    emit(await _getAllSavedArticles());
  }

  Future<LocalArticlesCubitState> _getAllSavedArticles() async {
      final articles = await _databaseRepository.getSavedArticle();
      return LocalArticlesSuccess(articles: articles);
  }

  Future<void> saveArticles({required Article article}) async {
    await _databaseRepository.saveArticle(article);
    emit(await _getAllSavedArticles());
  }

  Future<void> removeArticles({required Article article}) async {
    await _databaseRepository.deleteArticle(article);
    emit(await _getAllSavedArticles());
  }

}
