import '../models/response/article.dart';

abstract class DatabaseRepository {
  
  Future<List<Article>> getSavedArticle();

  Future<void> saveArticle(Article article);

  Future<void> deleteArticle(Article article);

}
