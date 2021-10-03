part of warframe_codex;

class ModItems extends StatelessWidget {
  const ModItems(this.mod, {Key? key}) : super(key: key);
  final ModModel mod;

  Future<dynamic> showThumbnail(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        buttonPadding: EdgeInsets.zero,
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.0),
        content: SizedBox(
          height: 550,
          child: Image.network(
            mod.wikiaThumbnail!,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  void noPreviewAvailable(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 20.0,
        backgroundColor: const Color.fromRGBO(12, 12, 12, 1.0),
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Preview not available for ${mod.name}',
          style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1.0),
          ),
        ),
      ),
    );
  }

  Color rarityColor() {
    final String rarity = mod.rarity;
    if (rarity == 'Rare') return const Color.fromRGBO(201, 157, 59, 1.0);
    if (rarity == 'Uncommon') return const Color.fromRGBO(178, 180, 182, 1.0);
    if (rarity == 'Common') return const Color.fromRGBO(156, 96, 52, 1.0);

    return const Color.fromRGBO(155, 155, 155, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        WarframeContainer(
          onTap: () => mod.wikiaThumbnail != null
              ? showThumbnail(context)
              : noPreviewAvailable(context),
          verticalMargin: 5.0,
          color: const Color.fromRGBO(255, 255, 255, 0.9),
          child: WarframePlatform.isMobile
              ? _MobileModLabels(mod: mod)
              : _DesktopModLabels(mod: mod),
        ),
        Positioned(
          top: 5.0,
          bottom: 5.0,
          left: 12.0,
          child: WarframeContainer(
            verticalMargin: 0.0,
            verticalPadding: 0.0,
            horizontalPadding: 0.0,
            horizontalMargin: 0.0,
            width: WarframePlatform.isMobile ? 15 : 20,
            height: 5,
            color: rarityColor(),
          ),
        ),
        if (WarframePlatform.isDesktop)
          Positioned(
            top: 10.0,
            right: 25.0,
            child: Text(
              mod.polarity,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 0, 0, 0.2),
              ),
            ),
          ),
      ],
    );
  }
}

class _MobileModLabels extends StatelessWidget {
  const _MobileModLabels({
    Key? key,
    required this.mod,
  }) : super(key: key);

  final ModModel mod;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 10.0),
        if (WarframePlatform.isDesktop) const SizedBox(width: 20.0),
        Text(
          mod.name,
          style: const TextStyle(
            fontSize: 15.0,
            color: Color.fromRGBO(0, 0, 0, 1.0),
          ),
        ),
        const Spacer(),
        Text(
          mod.polarity,
          style: const TextStyle(
            fontSize: 11.0,
            color: Color.fromRGBO(0, 0, 0, 0.3),
          ),
        ),
      ],
    );
  }
}

class _DesktopModLabels extends StatelessWidget {
  const _DesktopModLabels({
    Key? key,
    required this.mod,
  }) : super(key: key);

  final ModModel mod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Text(
        mod.name,
        softWrap: true,
        style: const TextStyle(
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(0, 0, 0, 1.0),
        ),
      ),
    );
  }
}
