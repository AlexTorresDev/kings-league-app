import 'package:kings_league_app/src/config/common.dart';
import 'package:kings_league_app/src/domain/entities/entities.dart';
import 'package:kings_league_app/src/presentation/pages/home/widgets/team_name.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({
    super.key,
    required this.data,
  });

  final List<Leaderboard> data;

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.all(26.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: FixedColumnWidth(80.0),
            1: FlexColumnWidth(),
            2: FixedColumnWidth(60.0),
            3: FixedColumnWidth(60.0),
          },
          border: TableBorder(
            horizontalInside: BorderSide(
              color: theme.dividerColor,
            ),
          ),
          children: [
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              children: [
                _cell('Pos.', isUpper: true),
                _cell('Equipo', isUpper: true),
                _cell('V', isUpper: true, isCenter: true),
                _cell('D', isUpper: true, isCenter: true),
              ],
            ),
            for (int i = 0; i < widget.data.length; i++)
              TableRow(
                children: [
                  _cell('${i + 1}', isCenter: true, isBold: true),
                  TeamName(
                    id: widget.data[i].team.id,
                    name: widget.data[i].team.name,
                    logo: widget.data[i].team.image,
                  ),
                  _cell(widget.data[i].wins.toString(), isCenter: true),
                  _cell(widget.data[i].losses.toString(), isCenter: true),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _cell(
    String text, {
    bool isBold = false,
    bool isUpper = false,
    bool isCenter = false,
  }) {
    Alignment alignment = Alignment.centerLeft;
    Color color = Colors.black;
    FontWeight fontWeight = FontWeight.normal;

    if (isUpper) {
      text = text.toUpperCase();
    }

    if (isCenter) {
      alignment = Alignment.center;
    }

    if (isUpper) {
      color = Colors.white;
      fontWeight = FontWeight.bold;
    }

    if (isBold) {
      fontWeight = FontWeight.bold;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
      alignment: alignment,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: fontWeight,
            ),
      ),
    );
  }
}
