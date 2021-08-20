library warframe_news;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:warframe/core/presentation/presentation.dart';
import 'package:warframe/features/warframe_news/data/datasources/warframe_news_remote_datasource.dart';

import 'data/models/warframe_news.dart';

part 'presentation/screens/news.dart';

part 'presentation/widgets/news_list.dart';
part 'presentation/widgets/news_card_item.dart';
