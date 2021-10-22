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
    this.desktopMaxCrossAxisExtent = 570,
    this.desktopMainAxisExtent = 290,
    this.mobileMainAxisExtent = 195,
    required this.itemBuilder,
    this.physics = const BouncingScrollPhysics(),
  }) : super(key: key);

  final int itemCount;
  final double desktopMaxCrossAxisExtent;
  final double desktopMainAxisExtent;
  final double mobileMainAxisExtent;
  final ScrollPhysics physics;
  final Axis scrollDirection;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: key,
      padding: WarframePlatform.isDesktop
          ? const EdgeInsets.only(right: 5, bottom: 30)
          : const EdgeInsets.only(bottom: 20),
      physics: physics,
      scrollDirection: scrollDirection,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      gridDelegate: WarframePlatform.isMobile
          ? SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisExtent: mobileMainAxisExtent,
              childAspectRatio: 2,
            )
          : SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: desktopMaxCrossAxisExtent,
              mainAxisExtent: desktopMainAxisExtent,
              childAspectRatio: 3,
            ),
    );
  }
}
