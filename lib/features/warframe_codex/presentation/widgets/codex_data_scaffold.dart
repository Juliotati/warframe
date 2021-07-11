import 'package:flutter/material.dart';
import '../../../../export/warframe_ui.dart';

class CodexDataScaffold extends StatelessWidget {
  const CodexDataScaffold({
    Key? key,
    required this.label,
    required this.body,
  }) : super(key: key);

  final String label;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.7),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: WarframeContainer(
          horizontalPadding: 0.0,
          verticalPadding: 0.0,
          margin: 9.0,
          centerChild: true,
          color: const Color.fromRGBO(255, 255, 255, 0.4),
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back),
        ),
        titleSpacing: 0.0,
        title: WarframeContainer(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 18,
                  color: const Color.fromRGBO(0, 0, 0, 1.0),
                ),
          ),
        ),
      ),
      body: body,
    );
  }
}
