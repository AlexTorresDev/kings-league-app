import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kings_league_app/src/config/common.dart';
import 'package:kings_league_app/src/presentation/blocs/blocs.dart';
import 'package:kings_league_app/src/presentation/pages/home/widgets/leaderboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<LeaderboardCubit>().getAll();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: AppBar(
        title: const Text('Home'),
        titleTextStyle: theme.textTheme.headline6?.copyWith(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.colorScheme.secondary,
                theme.colorScheme.primary,
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<LeaderboardCubit, LeaderboardState>(
        builder: (context, state) {
          if (state is LeaderboardLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LeaderboardLoaded) {
            return LeaderBoard(data: state.leaderboard);
          } else if (state is LeaderboardError) {
            return const Center(
              child: Text('Home Error'),
            );
          } else {
            return const Center(
              child: Text('Home Unknown'),
            );
          }
        },
      ),
    );
  }
}
