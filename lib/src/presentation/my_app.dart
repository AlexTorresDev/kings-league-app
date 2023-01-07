import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kings_league_app/src/config/common.dart';
import 'package:kings_league_app/src/core/framework/router.dart';
import 'package:kings_league_app/src/core/framework/theme.dart';
import 'package:kings_league_app/src/injector.dart' as di;
import 'package:kings_league_app/src/presentation/blocs/blocs.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.getIt<LeaderboardCubit>(),
        ),
        BlocProvider(
          create: (_) => di.getIt<TeamCubit>(),
        ),
        BlocProvider(
          create: (_) => di.getIt<PresidentCubit>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) => locale,
        theme: ThemeData(
          colorScheme: AppTheme.defaultLightColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: AppTheme.defaultDarkColorScheme,
          useMaterial3: true,
        ),
      ),
    );
  }
}
