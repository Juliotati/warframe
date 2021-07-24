import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:warframe/core/presentation/apis.dart';

import '../../../../export/warframe_ui.dart';

abstract class WarframeRemoteDatasource {
  /// Gets the data about the warframe provided as a parameter from the local
  /// list of warframes previously populated.
  WarframeModel getWarframe(String warframeName);

  /// Gets all Prime and non-prime warframes from the official warframe API
  Future<void> getAllWarframes();
}

class WarframeNetwork extends WarframeRemoteDatasource with ChangeNotifier {
  List<WarframeModel> get data => _warframes;

  final List<WarframeModel> _warframes = <WarframeModel>[];

  @override
  WarframeModel getWarframe(String warframeName) {
    return _warframes.firstWhere((WarframeModel warframe) {
      return warframe.name == warframeName;
    });
  }

  @override
  Future<void> getAllWarframes() async {
    final http.Response response = await http.get(Uri.parse(API.warframeAPI));

    if (response.statusCode != 200) return;

    List<dynamic>? _decodedWarframes = await jsonDecode(response.body) as List<dynamic>;

    if (_warframes.isNotEmpty) {
      _decodedWarframes = null;
      return;
    }

    final Iterable<WarframeModel> parsedWarframes = _decodedWarframes.map((dynamic warframe) {
      return WarframeModel.fromJson(warframe as Map<String, dynamic>);
    });

    if (_warframes.isEmpty) _warframes.addAll(parsedWarframes);
  }
}
