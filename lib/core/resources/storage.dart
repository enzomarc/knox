import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  SharedPreferences _preferences;

  /// Load collections data from shared preferences.
  getCollections() async {
    if (_preferences == null) _preferences = await SharedPreferences.getInstance();
    String json = _preferences.getString('collections');

    if (json != null)
      return jsonDecode(json);
    else {
      await _preferences.setString('collections', jsonEncode({}));
      return {};
    }
  }

  /// Get data from storage.
  /// Returns `defaultValue` if defined and data does not exists.
  dynamic get(String collection, {defaultValue}) async {
    var collections = await getCollections();
    var data = collections[collection];
    if (data == null && defaultValue != null) return defaultValue;

    return data;
  }

  /// Persist `data` into the given `collection`.
  Future store(String collection, dynamic data) async {
    await getCollections().then((collections) async {
      if (!collections.containsKey(collection)) collections[collection] = [];
      collections[collection].add(data);

      await _preferences.setString('collections', jsonEncode(collections));
    });
  }

  /// Return `true` if the given `item` exists into the given `collection`.
  Future<bool> contains(String collection, dynamic item) async {
    bool exists = false;

    await getCollections().then((collections) {
      if (collections.containsKey(collection)) exists = collections[collection].contains(item);
    });

    return exists;
  }

  /// Delete data with the given `key` from storage.
  Future delete(String collection, int index) async {
    await getCollections().then((collections) async {
      if (!collections.containsKey(collection)) return false;

      if (collections[collection][index] != null) {
        collections[collection].removeAt(index);
      }

      return await _preferences.setString('collections', jsonEncode(collections));
    });
  }
}

Storage storage = Storage();
