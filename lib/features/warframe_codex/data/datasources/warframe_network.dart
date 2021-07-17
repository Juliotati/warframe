import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/core/presentation/apis.dart';

import '../../../../export/warframe_ui.dart';

class WarframeNetwork with ChangeNotifier {
  List<WarframeModel> get data => _warframes;

  final List<WarframeModel> _warframes = <WarframeModel>[];

  /// Gets the data about the warframe provided as a parameter from the local
  ///  list of warframes previously populated.
  WarframeModel getWarframe(String warframeName) {
    return _warframes.firstWhere((WarframeModel warframe) {
      return warframe.name == warframeName;
    });
  }

  /// Gets all Prime and non-prime warframes from the official warframe API
  Future<void> getAllWarframes() async {
    final http.Response response = await http.get(Uri.parse(API.warframeAPI));

    final List<dynamic> _data =
        await json.decode(response.body) as List<dynamic>;

    final Iterable<WarframeModel> warframesData = _data.map((dynamic warframe) {
      return WarframeModel.fromJson(warframe as Map<String, dynamic>);
    });

    if (_warframes.isEmpty) _warframes.addAll(warframesData);
  }
}
