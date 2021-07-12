part of widgets;

class CodexDataScaffold extends StatelessWidget {
  const CodexDataScaffold({
    Key? key,
    required this.label,
    required this.body,
    this.icon,
  }) : super(key: key);

  final String label;
  final Widget body;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Hero(
          tag: 'app-bar-icon',
          child: Material(
            child: WarframeContainer(
              horizontalPadding: 0.0,
              verticalPadding: 0.0,
              margin: 9.0,
              centerChild: true,
              color: const Color.fromRGBO(255, 255, 255, 0.6),
              onTap: () => Navigator.of(context).pop(),
              child:   Icon(
                icon ?? Icons.arrow_back,
                color: const Color.fromRGBO(255, 255, 255, 1.0),
              ),
            ),
          ),
        ),
        titleSpacing: 0.0,
        title: Hero(
          tag: 'app-bar-title',
          child: Material(
            child: WarframeContainer(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 24,
                      color: const Color.fromRGBO(0, 0, 0, 1.0),
                    ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(kBackgroundShip),
            fit: BoxFit.cover,
          ),
        ),
        child: body,
      ),
    );
  }
}
