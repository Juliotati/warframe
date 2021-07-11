import 'package:flutter/material.dart';
import '../../../../core/presentation/presentation.dart';
import '../screens/codex_category_data.dart';

class CodexCategoryItem extends StatelessWidget {
  const CodexCategoryItem(this.category, {Key? key}) : super(key: key);
  final String category;

  void navigateToDataScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      CodexCategoryData.route,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size _screen = MediaQuery.of(context).size;
    return SizedBox(
      height: 55,
      width: _screen.width,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 10.0),
          WarframeContainer(
            onTap: () => navigateToDataScreen(context),
            margin: 4.0,
            width: 50.0,
            color: const Color.fromRGBO(255, 255, 255, 0.6),
          ),
          const SizedBox(width: 8.0),
          WarframeContainer(
            onTap: () => navigateToDataScreen(context),
            width: _screen.width * 0.7,
            withShadow: true,
            margin: 4.0,
            child: Text(
              category,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: const Color.fromRGBO(0, 0, 0, 1.0),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
