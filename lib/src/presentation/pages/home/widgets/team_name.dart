import 'package:flutter_svg/flutter_svg.dart';
import 'package:kings_league_app/src/config/common.dart';
import 'package:kings_league_app/src/core/framework/router.dart';

class TeamName extends StatelessWidget {
  const TeamName({
    super.key,
    required this.id,
    required this.name,
    required this.logo,
  });

  final String id;
  final String name;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => router.push('/team/$id'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            SvgPicture.network(
              logo,
              placeholderBuilder: (_) => const SizedBox(
                width: 24.0,
                height: 24.0,
              ),
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                name,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
