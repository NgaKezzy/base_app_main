import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class StorageModule {
  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

@lazySingleton
class SharedPrefs {
  final SharedPreferences _prefs;

  SharedPrefs(this._prefs);
}
