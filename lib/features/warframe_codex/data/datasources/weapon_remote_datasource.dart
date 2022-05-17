import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:warframe/core/keys/apis.dart';

abstract class WeaponsRemoteDatasource {
  /// Gets all Prime and non-prime weapons
  Future<void> weapons();
}

class WeaponsRemoteDatasourceImpl extends WeaponsRemoteDatasource {
  @override
  Future<List<dynamic>?> weapons() async {
    final http.Response response = await http.get(Uri.parse(API.weaponsAPI));

    if (response.statusCode != 200) return null;

    return await json.decode(response.body) as List<dynamic>;
  }
}
