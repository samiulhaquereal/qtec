import 'package:ecommerce/src/app_config/imports/import.dart';
import 'dart:io';

class ConnectivityService {
  final Connectivity _connectivity;

  ConnectivityService(this._connectivity);

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) return false;

      final lookupResult = await InternetAddress.lookup('google.com');
      return lookupResult.isNotEmpty && lookupResult.first.rawAddress.isNotEmpty;
    } catch (e) {
      debugPrint('Connectivity check error: $e');
      return false;
    }
  }

  Stream<bool> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged.asyncMap((result) async {
      if (result == ConnectivityResult.none) return false;
      try {
        final lookupResult = await InternetAddress.lookup('google.com');
        return lookupResult.isNotEmpty && lookupResult.first.rawAddress.isNotEmpty;
      } catch (_) {
        return false;
      }
    }).distinct();
  }
}


