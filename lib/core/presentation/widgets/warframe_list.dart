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
      key: key,
      physics: physics,
      scrollDirection: scrollDirection,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}

class WarframeGridViewBuilder extends StatelessWidget {
  const WarframeGridViewBuilder({
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
    return GridView.builder(
      key: key,
      physics: physics,
      scrollDirection: scrollDirection,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      gridDelegate: WarframePlatform.isMobile
          ? const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisExtent: 195,
              childAspectRatio: 2,
            )
          : const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 570,
              mainAxisExtent: 290,
              childAspectRatio: 3,
            ),
    );
  }
}
