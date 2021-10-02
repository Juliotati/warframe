part of warframe_news;

class NewsWebview extends StatelessWidget {
  const NewsWebview(this.url);

  static const String route = '/news-webview';

  final String url;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) return MobileWebview(url);

    return PCWebview(url);
  }
}

class MobileWebview extends StatefulWidget {
  const MobileWebview(this.url);

  final String url;

  @override
  State<MobileWebview> createState() => _MobileWebviewState();
}

class _MobileWebviewState extends State<MobileWebview> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
      gestureNavigationEnabled: true,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}

class PCWebview extends StatefulWidget {
  const PCWebview(this.url);

  final String url;

  @override
  _PCWebviewState createState() => _PCWebviewState();
}

class _PCWebviewState extends State<PCWebview> {
  final win.WebviewController _controller = win.WebviewController();

  Future<void> _initialize() async {
    await _controller.initialize();
    await _controller.setBackgroundColor(Colors.blue);
    await _controller.loadUrl(widget.url);
  }

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
          stream: _controller.title,
          builder: (_, AsyncSnapshot<String> snapshot) {
            return Text(snapshot.data ?? '');
          },
        ),
        actions: <WebviewControl>[
          WebviewControl(
            onTap: () => _controller.clearCache(),
            icon: Icons.delete_forever,
            label: 'Cache',
          ),
          WebviewControl(
              onTap: () => _controller.clearCookies(),
              icon: Icons.delete_sweep,
              label: 'Cookies',
          ),
          WebviewControl(
            onTap: () => _controller.reload(),
            icon: Icons.refresh,
            label: 'Refresh',
          ),
        ],
      ),
      body: StreamBuilder<win.LoadingState>(
        stream: _controller.loadingState,
        builder: (_, AsyncSnapshot<win.LoadingState> snapshot) {
          if (snapshot.data == win.LoadingState.loading) {
            return const LoadingIndicator();
          } else {
            return SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: win.Webview(_controller));
          }
        },
      ),
    );
  }
}
