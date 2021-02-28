import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:warframe/service/warframe_http.dart';
import 'package:warframe/utilities/scaffold.dart';

const String imagePlaceholder =
    'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fvignette2.wikia.nocookie.net%2Fwarframe%2Fimages%2Fd%2Fd4%2FWarframe_new_logo_look_vector_by_tasquick-d87fzxg.png%2Frevision%2Flatest%3Fcb%3D20160218161453&f=1&nofb=1';

class ActivitiesScreen extends StatefulWidget {
  static const String route = 'activities_screen';

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  Future<void> _refresh() async {
    await Provider.of<WarframeNetwork>(context, listen: false).getWarframes();
    setState(() {});
    return;
  }

  @override
  Widget build(BuildContext context) {
    final WarframeNetwork _data =
        Provider.of<WarframeNetwork>(context, listen: false);
    return SafeArea(
      child: WarframeScaffold(
          screenName: 'activities',
          child: const WarframeError('Check News or Codex')),
    );
  }
}

class WarframeError extends StatelessWidget {
  const WarframeError([this.message]);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message ?? 'Found no warframes'),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator([this.label]);
final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  <Widget>[
        const CircularProgressIndicator(backgroundColor: Colors.white),
        const SizedBox(height: 5),
        Text(label ?? 'Getting warframes...'),
      ],
    );
  }
}
