import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart' show BuildContext;
import 'package:warframe/core/presentation/widgets/snack_bar.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetWorkInfoImpl implements NetworkInfo {
  NetWorkInfoImpl._();

  static NetWorkInfoImpl instance = NetWorkInfoImpl._();

  @override
  Future<bool> get isConnected => _isConnected();

  Future<void> noConnectionWarning(BuildContext context) async {
    if (await _hasNoNetwork()) {
      warframeErrorSnackBar(context, 'No connection found');
      return;
    }
  }

  Future<bool> _isConnected() async {
    if (await _hasNoNetwork()) return false;
    if (await _hasNetwork()) return true;
    return false;
  }

  Future<bool> _hasNetwork() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }

  Future<bool> _hasNoNetwork() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.none || !(await _hasNetwork());
  }

  Future<Stream<ConnectivityResult>> connectionChanged() async {
    return Connectivity().onConnectivityChanged;
  }
}
