import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'src/config/router/app_router.dart';
import 'src/config/themes/app_themes.dart';
import 'src/domain/repositories/api_repository.dart';
import 'src/domain/repositories/database_repository.dart';
import 'src/locator.dart';
import 'src/presentation/blocs/local_articles/cubit/local_articles_cubit_cubit.dart';
import 'src/presentation/blocs/remote_articles/cubit/remote_articles_cubit.dart';
import 'src/utils/constants/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RemoteArticlesCubit(locator<ApiRepository>())
            ..getBreakingNewsArticles(),
        ),
        BlocProvider(
          create: (context) => LocalArticlesCubit(locator<DatabaseRepository>())
            ..getAllSavedArticles(),
        )
      ],
      child: OKToast(
          child: MaterialApp(
        onGenerateRoute: AppRoute.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        // routerConfig: router,
        title: appTitle,
        theme: AppTheme.light,
      )),
    );
  }
}
