import 'package:flutter/material.dart';
import 'package:warframe/ui/widgets/warframe_container.dart';

class DrawerItemList extends StatelessWidget {
  const DrawerItemList({
    Key? key,
    required this.leadingIcon,
    required this.label,
    this.onTap,
  }) : super(key: key);

  final IconData leadingIcon;
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final Size _screen = MediaQuery.of(context).size;
    return SizedBox(
      height: 45,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 4.0),
          WarframeContainer(
            margin: 4.0,
            width: 40.0,
            centerChild: true,
            verticalPadding: 0.0,
            horizontalPadding: 0.0,
            color: const Color.fromRGBO(255, 255, 255, 0.3),
            child: Icon(
              leadingIcon,
            ),
          ),
          const SizedBox(width: 4.0),
          WarframeContainer(
            onTap: onTap,
            width: _screen.width * 0.6,
            color: const Color.fromRGBO(255, 255, 255, 0.8),
            withShadow: true,
            margin: 4.0,
            child: Text(
              label.toUpperCase(),
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: const Color.fromRGBO(0, 0, 0, 1.0),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
