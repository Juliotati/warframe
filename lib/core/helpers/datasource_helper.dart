import 'dart:convert';

import 'package:flutter/cupertino.dart' show debugPrint;
import 'package:http/http.dart' as http;

class DatasourceHelper {
  /// Get the decoded response body as List<dynamic>
  static Future<List<dynamic>> decode(String body) async {
    return await jsonDecode(body) as List<dynamic>;
  }

  /// Sends an HTTP GET request with no extra added parameters
  static Future<http.Response> get(String api) async {
    return http.get(Uri.parse(api));
  }
}
