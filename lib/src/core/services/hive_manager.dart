import 'dart:developer';
import 'package:ecommerce/src/app_config/imports/import.dart';

class HiveManager {
  static bool _isInitialized = false;

  static final HiveManager _instance = HiveManager._internal();
  factory HiveManager() {
    return _instance;
  }
  HiveManager._internal();

  static Future<void> initHive() async {
    if (_isInitialized) return;

    try {
      await Hive.initFlutter();

      Hive.registerAdapter(ProductInformationModelAdapter());
      Hive.registerAdapter(RatingAdapter());

      _isInitialized = true;
      log('Hive initialized and product box opened.');
    } catch (e) {
      log('Error initializing Hive: $e');
    }
  }
}