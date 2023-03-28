import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PreferencesHelper {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();


  Future<void> saveString(String key, String? data) async {
    if (data != null) {
      await _secureStorage.write(key: key, value: data);
    } else {
      await _secureStorage.delete(key: key);
    }
  }

  Future<String?> getString(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> saveDouble(String key, double value) async {
    await _secureStorage.write(key: key, value: value.toString());
  }

  Future<double?> getDouble(String key) async {
    String? value = await _secureStorage.read(key: key);
    return value != null ? double.parse(value) : null;
  }

  Future<void> saveBoolean(String key, bool value) async {
    await _secureStorage.write(key: key, value: value.toString());
  }

  Future<bool?> getBoolean(String key) async {
    String? value = await _secureStorage.read(key: key);
    return value != null ? value.toLowerCase() == 'true' : null;
  }

  Future<void> saveInt(String key, int value) async {
    await _secureStorage.write(key: key, value: value.toString());
  }

  Future<int?> getInt(String key) async {
    String? value = await _secureStorage.read(key: key);
    return value != null ? int.parse(value) : null;
  }


  Future<void> removeValue(String key) async {
    await _secureStorage.delete(key: key);
  }


}