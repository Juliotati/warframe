part of presentation;

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
    return SizedBox(
      height: 45,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 4.0),
          Expanded(
            child: WarframeContainer(
                              horizontalMargin: 4.0,
                verticalMargin: 4.0,
              centerChild: true,
              verticalPadding: 0.0,
              horizontalPadding: 0.0,
              color: const Color.fromRGBO(255, 255, 255, 0.3),
              child: Icon(
                leadingIcon,
              ),
            ),
          ),
          const SizedBox(width: 2.0),
          Expanded(
            flex: 5,
            child: WarframeContainer(
              onTap: onTap,
              color: const Color.fromRGBO(255, 255, 255, 0.8),
              withShadow: true,
                             horizontalMargin: 04.0,
                verticalMargin: 4.0,
              child: Text(
                label.toUpperCase(),
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: const Color.fromRGBO(0, 0, 0, 1.0),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ),
          const SizedBox(width: 2.0),
        ],
      ),
    );
  }
}
