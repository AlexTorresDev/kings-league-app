import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kings_league_app/src/config/common.dart';
import 'package:kings_league_app/src/presentation/blocs/blocs.dart';

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

    return BlocBuilder<TeamCubit, TeamState>(
      builder: (_, state) {
        if (state is TeamLoading) {
          return Scaffold(
            backgroundColor: theme.colorScheme.primary,
            appBar: AppBar(
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
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is TeamLoaded) {
          final team = state.team;
          return Scaffold(
            backgroundColor: theme.colorScheme.primary,
            appBar: AppBar(
              title: Text(team.name),
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
              margin: const EdgeInsets.all(24.0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    stops: const [0.25, 1.0],
                    colors: [
                      Color(int.parse(team.color!.replaceAll('#', '0xFF'))),
                      const Color(0xFF111827)
                    ],
                  ),
                  /*image: DecorationImage(
                    image: NetworkImage(team.imageWhite!),
                    fit: BoxFit.cover,
                  ),*/
                ),
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.network(
                              team.imageWhite!,
                              height: 64.0,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 24.0),
                            Text(
                              team.name,
                              style: theme.textTheme.headline6?.copyWith(
                                color: theme.colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }
      },
    );
  }
}
