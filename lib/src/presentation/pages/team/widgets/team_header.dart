import 'package:flutter_svg/flutter_svg.dart';
import 'package:kings_league_app/src/config/common.dart';
import 'package:kings_league_app/src/domain/entities/entities.dart';

class TeamHeader extends StatelessWidget {
  const TeamHeader({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
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
        const SizedBox(height: 4.0),
        Text(
          team.name,
          maxLines: 2,
          style: theme.textTheme.headline5?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['instagram', 'twitter', 'youtube', 'tiktok', 'twitch']
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
    );
  }
}
