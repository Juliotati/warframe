part of presentation;

class ItemsColumn extends StatelessWidget {
  const ItemsColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: drawerItems
              .map((DrawerItemModel item) => DrawerItemList(
                  leadingIcon: item.leadingIcon,
                  label: item.label,
                  onTap: () {
                    Navigator.of(context).pop();
                    return context.read<ScreenDelegate>().updateScreen(
                          item.screen,
                          item.label,
                        );
                  }))
              .toList(),
        ),
      ),
    );
  }
}
