import '../../../../export/warframe_ui.dart';

class WarframeListItem extends StatelessWidget {
  const WarframeListItem(
    this.warframe, {
    required Key key,
  }) : super(key: key);

  final WarframeModel warframe;

  void selectedWarframe(BuildContext context) {
    Navigator.of(context).pushNamed(
      WarframeProfile.route,
      arguments: warframe,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          key: key,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              WarframeContainer(
                onTap: () => selectedWarframe(context),
                withShadow: true,
                height: 197,
                margin: 0.0,
                width: double.infinity,
                color: const Color.fromRGBO(255, 255, 255, 0.65),
                showImage: true,
                backgroundImage: warframe.wikiaThumbnail ?? kImagePlaceholder,
              ),
              Hero(
                tag: warframe.wikiaThumbnail ?? kImagePlaceholder,
                child: Material(
                  color: const Color.fromRGBO(0, 0, 0, 0.0),
                  child: WarframeContainer(
                    onTap: () => selectedWarframe(context),
                    withShadow: true,
                    height: 197,
                    margin: 0.0,
                    width: double.infinity,
                    color: const Color.fromRGBO(255, 255, 255, 0.65),
                    showImage: true,
                    backgroundImage:
                        warframe.wikiaThumbnail ?? kImagePlaceholder,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                bottom: -8.0,
                left: 15.0,
                right: 15.0,
                child: WarframeContainer(
                  onTap: () => selectedWarframe(context),
                  margin: 0.0,
                  withShadow: true,
                  width: double.infinity,
                  child: Text(
                    warframe.name.toUpperCase(),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          color: const Color.fromRGBO(0, 0, 0, 1.0),
                        ),
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
