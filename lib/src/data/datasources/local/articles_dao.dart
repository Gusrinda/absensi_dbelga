import 'package:floor/floor.dart';

import '../../../domain/models/response/article.dart';
import '../../../utils/constants/strings.dart';

@dao
abstract class ArticlesDao {
  
  @Query('SELECT * FROM $articlesTableName')
  Future<List<Article>> getAllArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertArticle(Article article);

  @delete
  Future<void> deleteArticle(Article article);

}