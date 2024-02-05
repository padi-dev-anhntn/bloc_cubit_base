import 'dart:convert';

import 'package:bloc_cubit_base/database/share_preferences_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _apiTokenKey = '_apiTokenKey';

  final FlutterSecureStorage _storage;

  SecureStorage._(this._storage);

  static final SecureStorage _instance =
  SecureStorage._(const FlutterSecureStorage());

  static SecureStorage get instance => _instance;

  //Save token
  // void saveToken(TokenEntity token) async {
  //   await _storage.write(key: _apiTokenKey, value: jsonEncode(token.toJson()));
  //   SharedPreferencesStorage.setApiTokenKey(_apiTokenKey);
  // }

  //Remove token
  // void removeToken() async {
  //   await _storage.delete(key: _apiTokenKey);
  //   SharedPreferencesStorage.removeApiTokenKey();
  // }
}