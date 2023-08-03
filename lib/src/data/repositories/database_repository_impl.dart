import '../../domain/models/response/article.dart';
import '../../domain/repositories/database_repository.dart';
import '../datasources/local/app_database.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {

  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);



  @override
  Future<void> deleteArticle(Article article) {
    return _appDatabase.articleDao.deleteArticle(article);
  }

  @override
  Future<List<Article>> getSavedArticle() {
    return _appDatabase.articleDao.getAllArticles();
  }

  @override
  Future<void> saveArticle(Article article) {
      return _appDatabase.articleDao.insertArticle(article);
  }

}