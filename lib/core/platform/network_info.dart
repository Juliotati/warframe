import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetWorkInfoImpl implements NetworkInfo {
  NetWorkInfoImpl._();

  static NetWorkInfoImpl instance = NetWorkInfoImpl._();

  @override
  Future<bool> get isConnected => _isConnected();

  Future<bool> _isConnected() async {
    if (await _hasNoNetwork()) return false;
    if (await _hasNetwork()) return true;
    return false;
  }

  final Future<ConnectivityResult> _result = Connectivity().checkConnectivity();

  Future<bool> _hasNetwork() async {
    final ConnectivityResult result = await _result;
    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }

  Future<bool> _hasNoNetwork() async {
    final ConnectivityResult result = await _result;
    return result == ConnectivityResult.none || !(await _hasNetwork());
  }

  Future<Stream<ConnectivityResult>> connectionChanged() async {
    return Connectivity().onConnectivityChanged;
  }
}