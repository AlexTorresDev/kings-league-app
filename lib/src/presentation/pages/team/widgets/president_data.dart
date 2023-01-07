import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kings_league_app/src/config/common.dart';
import 'package:kings_league_app/src/presentation/blocs/blocs.dart';

class PresidentData extends StatefulWidget {
  const PresidentData({
    Key? key,
    required this.presidentId,
  }) : super(key: key);

  final String presidentId;

  @override
  State<PresidentData> createState() => _PresidentDataState();
}

class _PresidentDataState extends State<PresidentData> {
  @override
  void initState() {
    super.initState();
    context.read<PresidentCubit>().getById(widget.presidentId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PresidentCubit, PresidentState>(
      builder: (_, state) {
        if (state is PresidentLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PresidentLoaded) {
          final president = state.president;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                president.image,
                height: 160.0,
                fit: BoxFit.contain,
                loadingBuilder: (_, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const SizedBox(
                      height: 64.0,
                      width: 64.0,
                    );
                  }
                },
              ),
              Text(
                president.name,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(
                'President',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          );
        } else {
          return const Text('Error');
        }
      },
    );
  }
}
