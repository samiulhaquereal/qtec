import 'package:ecommerce/src/app_config/imports/import.dart';

class HiveCache {
  static final Map<String, Box> _boxCache = {};

  static Future<Box<T>> _getBox<T>(String boxName) async {
    if (_boxCache.containsKey(boxName)) {
      return _boxCache[boxName] as Box<T>;
    } else {
      var box = await Hive.openBox<T>(boxName);
      _boxCache[boxName] = box;
      return box;
    }
  }

  static Future<void> setData<T>({required String boxName, required String key, required T value}) async {
    var box = await _getBox<T>(boxName);
    await box.put(key, value);
  }

  static Future<T?> getData<T>({required String boxName, required String key}) async {
    var box = await _getBox<T>(boxName);
    return box.get(key);
  }

  static Future<void> deleteData<T>({required String boxName, required String key}) async {
    var box = await _getBox<T>(boxName);
    await box.delete(key);
  }

  static Future<void> clearBox<T>({required String boxName}) async {
    var box = await _getBox<T>(boxName);
    await box.clear();
  }

  static Future<Box<T>> getBox<T>({required String boxName}) async {
    return await _getBox<T>(boxName);
  }
}