library warframe_news;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:warframe/core/presentation/presentation.dart';
import 'package:warframe/core/presentation/widgets/snack_bar.dart';
import 'package:warframe/core/utilities/platform.dart';
import 'package:warframe/features/warframe_news/data/datasources/news_remote_datasource.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_windows/webview_windows.dart' as win;

import 'data/models/warframe_news.dart';

part 'presentation/screens/news.dart';
part 'presentation/screens/news_webview.dart';
part 'presentation/widgets/webview_controls.dart';
part 'presentation/widgets/news_card_item.dart';
part 'presentation/widgets/news_list.dart';