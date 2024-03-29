import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warframe/core/helpers/screen_delegate.dart';
import 'package:warframe/core/platform/network_info.dart';
import 'package:warframe/core/presentation/presentation.dart';
import 'package:warframe/features/warframe_news/presentation/provider/news_provider.dart';

class WarframeWrapper extends StatefulWidget {
  const WarframeWrapper();

  static const String route = '/main';

  @override
  _WarframeWrapperState createState() => _WarframeWrapperState();
}

class _WarframeWrapperState extends State<WarframeWrapper> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  void initState() {
    NetWorkInfoImpl.instance.noConnectionWarning(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenDelegate layout = context.watch<ScreenDelegate>();
    final bool isNewsScreen = layout.screen == Screen.news;

    return WillPopScope(
      key: const Key('warframe-wrapper'),
      onWillPop: () {
        _openEndDrawer();
        return Future<bool>.value(false);
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawerEdgeDragWidth: 150,
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        drawer: const WarframeDrawer(),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(layout.label.toUpperCase()),
          actions: <WarframeContainer>[
            const WarframeContainer(
              height: 35,
              width: 35,
              horizontalMargin: 10.0,
              verticalMargin: 10.0,
              color: Color.fromRGBO(255, 255, 255, 0.4),
              centerChild: true,
              horizontalPadding: 0.0,
              verticalPadding: 0.0,
              child: Icon(Icons.group),
            ),
            WarframeContainer(
              height: 35,
              width: 35,
              horizontalMargin: 10.0,
              verticalMargin: 10.0,
              color: const Color.fromRGBO(255, 255, 255, 0.4),
              centerChild: true,
              horizontalPadding: 0.0,
              verticalPadding: 0.0,
              onTap: () {
                if (isNewsScreen) {
                  context.read<NewsProvider>().refreshNews();
                }
              },
              child: Icon(isNewsScreen ? Icons.refresh : Icons.chat_bubble),
            ),
          ],
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
          child: Center(
            child: layout.currentScreen(),
          ),
        ),
      ),
    );
  }
}
