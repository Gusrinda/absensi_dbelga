
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/response/article.dart';
import '../../presentation/views/article_detail_view.dart';
import '../../presentation/views/breaking_news_view.dart';
import '../../presentation/views/saved_article_view.dart';


class AppRoute {
  const AppRoute._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late WidgetBuilder builder;
    bool fullScreenDialog = false;

    switch (settings.name) {
      case BreakingNewsView.routeName:
        builder = (context) => const BreakingNewsView();
        break;
      case SavedArticlesView.routeName:
        builder = (context) => const SavedArticlesView();
        break;
      case ArticleDetailsView.routeName:
        Article article = settings.arguments as Article;
        builder = (context) =>  ArticleDetailsView(article: article);
        break;
      default:
        builder = (context) => const BreakingNewsView();
        break;
    }

    return MaterialPageRoute<void>(
        settings: settings,
        builder: builder,
        fullscreenDialog: fullScreenDialog,
        maintainState: true);
  }
}
