import 'package:shared_preferences/shared_preferences.dart';

import 'package:chef/helpers/exto_exception.dart';
import 'package:chef/services/services.dart';

class SharedPrefs extends IStorageService {
  SharedPrefs({
    required SharedPreferences sharedPreferences,
  }) : _prefs = sharedPreferences;

  static const _timeout = Duration(seconds: 30);
  final SharedPreferences _prefs;

  @override
  String readString({required String key}) {
    try {
      return _prefs.getString(key) ?? '';
    } catch (error) {
      throw StorageException(error.toString());
    }
  }

  @override
  int readInt({required String key}) {
    return _prefs.getInt(key) ?? 0;
  }

  @override
  Future<bool> writeString({
    required String key,
    required String data,
  }) async {
    try {
      return await _prefs.setString(key, data).timeout(_timeout);
    } catch (error) {
      throw StorageException(error.toString());
    }
  }

  @override
  Future<bool> clear() async {
    return await _prefs.clear();
  }

  @override
  Future<bool> writeInt({
    required String key,
    required int data,
  }) async {
    try {
      return await _prefs.setInt(key, data).timeout(_timeout);
    } catch (error) {
      throw StorageException(error.toString());
    }
  }

  @override
  bool readBool({required String key}) {
    return _prefs.getBool(key) ?? false;
  }

  @override
  Future<bool> writeBool({
    required String key,
    required bool data,
  }) async {
    try {
      return await _prefs.setBool(key, data).timeout(_timeout);
    } catch (error) {
      throw StorageException(error.toString());
    }
  }
}
