import 'package:ecommerce/src/app_config/imports/import.dart';

class ConnectivityService {
  final Connectivity _connectivity;

  ConnectivityService(this._connectivity);

  /// Checks if the device is currently connected to any network.
  /// Returns [true] if connected, [false] otherwise.
  /// Handles any exceptions that might occur during the check.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (e) {
      // Log the error or handle it as needed
      debugPrint('Connectivity check error: $e');
      return false;
    }
  }

  /// A stream of boolean values indicating network connectivity status.
  /// Emits [true] when connected and [false] when disconnected.
  Stream<bool> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged
        .map((result) => result != ConnectivityResult.none)
        .distinct();  // Only emit when the connectivity state actually changes
  }
}

