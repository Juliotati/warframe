import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/modals/warframe.dart';

class WarframeNetwork with ChangeNotifier {
  List<Warframe> get data => _warframes;

  final List<Warframe> _warframes = <Warframe>[];

  /// Gets the data about the warframe provided as a parameter from the local
  ///  list of warframes previsouly populated.
  Warframe getWarframe(String warframeName) {
    return _warframes.firstWhere((Warframe warframe) {
      return warframe.name == warframeName;
    });
  }

  /// Gets all Prime and non-prime warframes from the official warframe API
  Future<void> getAllWarframes() async {
    const String url = 'https://api.warframestat.us/warframes/';

    final http.Response response = await http.get(url);

    final List<dynamic> _data = await json.decode(response.body) as List<dynamic>;

    final Iterable<Warframe> warframesData = _data.map((warframe) => Warframe.fromJson(warframe));

    if (_warframes.isEmpty) _warframes.addAll(warframesData);
  }
}
