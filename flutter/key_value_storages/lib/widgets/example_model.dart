import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class _SharedPrefsKeys {
  static const nameKey = 'name_key';
}

abstract class _SecureStorageKeys {
  static const tokenKey = 'token';
}

class ExampleWidgetModel {
  final _storage = SharedPreferences.getInstance();
  final _secureStorage = const FlutterSecureStorage();

  Future<void> setName() async {
    final storage = await _storage;
    storage.setString(_SharedPrefsKeys.nameKey, 'Dart and Flutter');
  }

  Future<void> readName() async {
    final storage = await _storage;
    final name = storage.getString(_SharedPrefsKeys.nameKey);
    print(name);
  }

  Future<void> setToken() async {
    await _secureStorage.write(
        key: _SecureStorageKeys.tokenKey, value: '2oidj2fiewojodif02');
  }

  Future<void> readToken() async {
    final token = await _secureStorage.read(key: _SecureStorageKeys.tokenKey);
    print(token);
  }
}
