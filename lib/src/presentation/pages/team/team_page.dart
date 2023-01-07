import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kings_league_app/src/config/common.dart';
import 'package:kings_league_app/src/core/framework/colors.dart';
import 'package:kings_league_app/src/presentation/blocs/blocs.dart';
import 'package:kings_league_app/src/presentation/pages/team/widgets/president_data.dart';
import 'package:kings_league_app/src/presentation/pages/team/widgets/team_body.dart';
import 'package:kings_league_app/src/presentation/pages/team/widgets/team_header.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  void initState() {
    super.initState();
    context.read<TeamCubit>().getById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: AppBar(
        title: const Text('Equipo'),
        titleTextStyle: theme.textTheme.headline6?.copyWith(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
        leading: BackButton(
          color: theme.colorScheme.onPrimary,
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
      body: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: bgTeams[widget.id],
          ),
          child: BlocListener<TeamCubit, TeamState>(
            listener: (_, state) {
              if (state is TeamLoaded) {
                context.read<PresidentCubit>().getById(state.team.presidentId!);
              }
            },
            child: BlocBuilder<TeamCubit, TeamState>(
              builder: (_, teamState) {
                return BlocBuilder<PresidentCubit, PresidentState>(
                  builder: (_, presidentState) {
                    if (teamState is TeamLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (teamState is TeamLoaded) {
                      return SingleChildScrollView(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            TeamHeader(team: teamState.team),
                            const SizedBox(height: 24.0),
                            if (presidentState is PresidentLoaded)
                              PresidentData(
                                  president: presidentState.president),
                            const SizedBox(height: 24.0),
                            TeamBody(team: teamState.team),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text('Error'),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
