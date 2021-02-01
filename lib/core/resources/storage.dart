import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  SharedPreferences _preferences;
  Map<String, List<dynamic>> collections;

  _init() async {
    _preferences = await SharedPreferences.getInstance();
    reload();
  }

  /// Load collections data from shared preferences.
  void reload() {
    String json = _preferences.getString('collections');

    if (json != null)
      collections = jsonDecode(json);
    else
      collections = {};
  }

  Storage() {
    _init();
  }

  /// Get data from storage.
  /// Returns `defaultValue` if defined and data does not exists.
  dynamic get(String collection, {defaultValue}) {
    var data = collections[collection];
    if (data == null && defaultValue != null) return defaultValue;

    return data;
  }

  /// Persist `data` into the given `collection`.
  Future store(String collection, dynamic data) async {
    if (!collections.containsKey(collection)) collections[collection] = [];
    collections[collection].add(data);

    await _preferences.setString('collections', jsonEncode(collections));
    reload();
  }

  /// Return `true` if the given `item` exists into the given `collection`.
  bool contains(String collection, dynamic item) {
    bool exists = false;

    if (!collections.containsKey(collection))
      return exists;
    else
      exists = collections[collection].contains(item);

    return exists;
  }

  /// Delete data with the given `key` from storage.
  Future delete(String collection, int index) async {
    if (!collections.containsKey(collection)) return false;

    if (collections[collection][index] != null) {
      collections[collection].removeAt(index);
      return true;
    }

    return false;
  }
}

Storage storage = Storage();
