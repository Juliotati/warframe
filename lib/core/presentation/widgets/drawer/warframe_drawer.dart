part of presentation;

class WarframeDrawer extends StatelessWidget {
  const WarframeDrawer();

  @override
  Widget build(BuildContext context) {
    final Size _screen = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        key: const ValueKey<String>('warframe-main-drawer'),
        child: Container(
          width: _screen.width,
          color: const Color.fromRGBO(0, 0, 0, 0.8),
          child: Column(
            children: const <Widget>[
              AliasProfile(),
              SizedBox(height: 10.0),
              ItemsColumn(),
              DrawerFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
