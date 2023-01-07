import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kings_league_app/src/config/common.dart';
import 'package:kings_league_app/src/presentation/blocs/blocs.dart';
import 'package:kings_league_app/src/presentation/pages/team/widgets/president_data.dart';

class TeamHeader extends StatefulWidget {
  const TeamHeader({
    Key? key,
    required this.teamId,
  }) : super(key: key);

  final String teamId;

  @override
  State<TeamHeader> createState() => _TeamHeaderState();
}

class _TeamHeaderState extends State<TeamHeader> {
  @override
  void initState() {
    super.initState();
    context.read<TeamCubit>().getById(widget.teamId);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<TeamCubit, TeamState>(
      builder: (_, state) {
        if (state is TeamLoading) {
          return const Center(
            child: Text('Cargando...'),
          );
        } else if (state is TeamLoaded) {
          final team = state.team;

          return Row(
            children: [
              SvgPicture.network(
                team.imageWhite!,
                height: 64.0,
                fit: BoxFit.contain,
                placeholderBuilder: (_) => const SizedBox(
                  height: 64.0,
                  width: 64.0,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      color: Colors.black,
                      width: 120.0,
                      child: Text(
                        team.name,
                        maxLines: 2,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4.0),
                      width: 120.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          'instagram',
                          'twitter',
                          'youtube',
                          'tiktok',
                          'twitch'
                        ]
                            .map(
                              (e) => GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/$e.svg',
                                  height: 20.0,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              PresidentData(presidentId: team.presidentId!),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
