part of presentation;

class ItemsColumn extends StatelessWidget {
  const ItemsColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        controller: ScrollController(debugLabel: '[DrawerItemColumn]'),
        itemCount: drawerItems.length,
        itemBuilder: (_, int index) {
          return DrawerItemList(
            leadingIcon: drawerItems[index].leadingIcon,
            label: drawerItems[index].label,
            onTap: () async {
              Navigator.of(context).pop();
              context.read<ScreenDelegate>().updateScreen(
                    drawerItems[index].screen,
                    drawerItems[index].label,
                  );
            },
          );
        },
      ),
    );
  }
}
