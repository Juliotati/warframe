import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;

class WarframePlatform {
  static bool isWeb = kIsWeb;

  static bool get isMobile {
    return !isWeb && (Platform.isAndroid || Platform.isIOS);
  }

  static bool get isDesktop {
    return Platform.isLinux || Platform.isWindows || Platform.isMacOS;
  }

  static bool get isWebOrDesktop {
    return isWeb || Platform.isLinux || Platform.isWindows || Platform.isMacOS;
  }
}
