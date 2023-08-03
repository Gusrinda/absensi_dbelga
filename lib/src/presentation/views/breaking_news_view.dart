import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

import '../../config/router/app_router.dart';
import '../../domain/models/response/article.dart';
import '../../utils/extensions/scroll_controller.dart';
import '../blocs/remote_articles/cubit/remote_articles_cubit.dart';
import '../widgets/article_widget.dart';
import 'article_detail_view.dart';

class BreakingNewsView extends HookWidget {
  const BreakingNewsView({super.key});

  static const String routeName = '/news-list';

  @override
  Widget build(BuildContext context) {
    final remoteArticlesCubit = BlocProvider.of<RemoteArticlesCubit>(context);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.onScrollEndsListener(() {
        remoteArticlesCubit.getBreakingNewsArticles();
      });

      return scrollController.dispose;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Daily News',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<RemoteArticlesCubit, RemoteArticlesState>(
          builder: (_, state) {
        switch (state.runtimeType) {
          case RemoteArticlesLoading:
            return Center(
              child: CupertinoActivityIndicator(),
            );
          case RemoteArticlesSuccess:
            return Center(
              child: buildArticles(
                scrollController,
                state.articles,
                state.noMoreDate,
              ),
            );
          case RemoteArticlesFailed:
            return Center(
              child: Icon(Ionicons.refresh),
            );
          default:
            return SizedBox();
        }
      }),
    );
  }

  Widget buildArticles(
    ScrollController scrollController,
    List<Article> articles,
    bool noMoreData,
  ) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => ArticleWidget(
                    article: articles[index],
                    onArticlePressed: (e) => Navigator.pushNamed(
                      context,
                      ArticleDetailsView.routeName,
                      arguments: e,
                    ),
                  ),
              childCount: articles.length),
        ),
        if (!noMoreData)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 14, bottom: 32),
              child: CupertinoActivityIndicator(),
            ),
          )
      ],
    );
  }
}
