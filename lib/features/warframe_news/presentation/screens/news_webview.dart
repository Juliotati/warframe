part of warframe_news;

class NewsPlatformWebview extends StatelessWidget {
  const NewsPlatformWebview(this.url);

  static const String route = '/news-webview';

  final String url;

  @override
  Widget build(BuildContext context) {
    if (WarframePlatform.isMobile) return _MobileWebview(url);

    return const Center(
      child: Text('Webview is only available on mobile'),
    );
  }
}

class _MobileWebview extends StatefulWidget {
  const _MobileWebview(this.url);

  final String url;

  @override
  State<_MobileWebview> createState() => __MobileWebviewState();
}

class __MobileWebviewState extends State<_MobileWebview> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: widget.url,
        gestureNavigationEnabled: true,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
