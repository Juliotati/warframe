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

  void _openWebview(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (_) => NewsWebview(newsItem.link),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return StackedContainer(
      key: Key(newsItem.id),
      onTap: () => _openWebview(context),
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
