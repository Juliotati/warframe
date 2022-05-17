part of warframe_news;

class NewsCardItem extends StatelessWidget {
  const NewsCardItem({
    Key? key,
    required this.newsItem,
  }) : super(key: key);

  final NewsModel newsItem;

  Future<void> _openWebPage(BuildContext context) async {
    if (WarframePlatform.isWebOrDesktop) {
      await _openDefaultBrowser(context);
      return;
    }
    _openWebview(context);
  }

  Future<void> _openDefaultBrowser(BuildContext context) async {
    try {
      if (await canLaunchUrl(Uri.parse(newsItem.link))) {
        await launchUrl(Uri.parse(newsItem.link));
        return;
      }
    } catch (_) {
      warframeErrorSnackBar(context, 'Could not open link');
      return;
    }
  }

  void _openWebview(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => NewsPlatformWebview(newsItem.link),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StackedContainer(
      key: Key(newsItem.id),
      onTap: () => _openWebPage(context),
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
