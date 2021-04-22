import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/modals/warframe.dart';

class WarframeNetwork with ChangeNotifier {
  List<Warframe> get data => _warframes;

  final List<Warframe> _warframes = <Warframe>[];

  /// API for getting  a single warframe, be prime or a normal one
  Warframe getWarframe(String warframeName) {
    return _warframes
        .firstWhere((Warframe warframe) => warframe.name == warframeName);
  }

  /// [Warframe official API] Gets  all warframes, be prime or a normal one
  Future<void> getAllWarframes() async {
    const String url = 'https://api.warframestat.us/warframes/';
    final http.Response response = await http.get(url);
    final List<dynamic> _data = await json.decode(response.body);

    final Iterable<Warframe> warframesData =
        _data.map((warframe) => Warframe.fromJson(warframe)).toList();

    if (_warframes.isEmpty) {
      _warframes.addAll(warframesData);
    }
  }
}
