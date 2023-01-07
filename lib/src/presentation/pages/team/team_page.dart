import 'package:kings_league_app/src/config/common.dart';
import 'package:kings_league_app/src/core/framework/colors.dart';
import 'package:kings_league_app/src/presentation/pages/team/widgets/team_header.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({
    super.key,
    required this.id,
  });

  final String id;

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
      body: Stack(
        children: [
          Card(
            margin: const EdgeInsets.all(24.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              decoration: BoxDecoration(
                gradient: bgTeams[id],
              ),
            ),
          ),
          Positioned(
            top: -5.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Column(
                children: [
                  TeamHeader(teamId: id),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
