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

  /// Check if an item already exists within a list through their unique
  /// identifier [id].
  ///
  /// If an element with the same [id] was not found, [itemExists] will throw a
  /// [StateError] and return false as the result otherwise it will return true.
  ///
  /// This method makes use of the [id] in a element to verify whether the item
  /// already exists in the list or not. Therefore it is not to be used to check
  /// the equality on two objects.
  ///
  /// The [element]s in the list and the single provided [element] must be of
  /// the same data type for better results,
  ///
  /// Avoid providing a list with different [element] data type as the single
  /// data the second property in the parameter of [itemExists].
  static bool idExists(
    List<dynamic> source,
    dynamic element, {
    bool showLog = false,
  }) {
    try {
      dynamic existingElement = source.firstWhere((dynamic _element) {
        return _element.id == element.id;
      });
      if (existingElement.id == element.id) {
        if (showLog) {
          debugPrint(
            'id: ${element.id} MATCHES EXISTING id: ${existingElement.id}',
          );
        }
        existingElement = null;
        return true;
      }

      return false;
    } catch (_) {
      if (showLog) {
        debugPrint('id: ${element.id} has no match');
      }
      return false;
    }
  }

  static bool uniqueNameExists(
    List<dynamic> source,
    dynamic element, {
    bool showLog = false,
  }) {
    try {
      dynamic existingElement = source.firstWhere((dynamic _element) {
        return _element.uniqueName == element.uniqueName;
      });
      if (existingElement.uniqueName == element.uniqueName) {
        if (showLog) {
          debugPrint(
            'uniqueName: ${element.uniqueName} MATCHES EXISTING uniqueName: ${existingElement.uniqueName}',
          );
        }
        existingElement = null;
        return true;
      }

      return false;
    } catch (_) {
      if (showLog) {
        debugPrint('uniqueName: ${element.uniqueName} HAS NO MATCH');
      }
      return false;
    }
  }
}
