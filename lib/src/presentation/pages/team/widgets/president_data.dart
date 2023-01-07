import 'package:kings_league_app/src/config/common.dart';
import 'package:kings_league_app/src/domain/entities/entities.dart';

class PresidentData extends StatelessWidget {
  const PresidentData({
    Key? key,
    required this.president,
  }) : super(key: key);

  final President president;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          president.image,
          height: 180.0,
          fit: BoxFit.contain,
          loadingBuilder: (_, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return const SizedBox(
                height: 180.0,
              );
            }
          },
        ),
        Text(
          president.name,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4.0),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4.0,
          ),
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(
            'Presidente'.toUpperCase(),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
