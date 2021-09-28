part of warframe_news;

class NewsCardItem extends StatelessWidget {
  const NewsCardItem({
    Key? key,
    required this.newsItem,
  }) : super(key: key);

  final WarframeNewsModel newsItem;

  Future<void> launchWebPage() async {
    if (await canLaunch(newsItem.link)) {
      await launch(newsItem.link);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return StackedContainer(
      key: Key(newsItem.id),
      onTap: launchWebPage,
      image: newsItem.imageLink,
      label: newsItem.message.toUpperCase(),
      tag: newsItem.imageLink,
      labelTag: newsItem.message,
      maxLines: 2,
      fontSize: 13,
      fit: BoxFit.cover,
    );
  }
}
