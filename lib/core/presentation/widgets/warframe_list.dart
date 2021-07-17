part of presentation;

class WarframeListViewBuilder extends StatelessWidget {
  const WarframeListViewBuilder({
    Key? key,
    required this.itemCount,
    this.scrollDirection = Axis.vertical,
    required this.itemBuilder,
    this.physics = const BouncingScrollPhysics(),
  }) : super(key: key);

  final int itemCount;
  final ScrollPhysics physics;
  final Axis scrollDirection;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: physics,
      scrollDirection: scrollDirection,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
