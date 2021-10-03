import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;

class WarframePlatform {
  static bool isWeb = kIsWeb;
  static bool isMobile = Platform.isAndroid || Platform.isIOS;
  static bool isDesktop =
      Platform.isLinux || Platform.isWindows || Platform.isMacOS;
}
