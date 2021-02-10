import 'dart:convert';

import 'package:knox/core/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  /// Store the created user account.
  Future<bool> createAccount(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.remove('user');
    return await preferences.setString('user', jsonEncode(user.toJson()));
  }

  /// Get the logged in user account.
  Future getAccount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    User user;

    String json = preferences.getString('user');
    if (json != null) user = User.fromJson(jsonDecode(json));

    return user;
  }

  /// Encrypt & store passcode given at registration.
  Future<bool> setPasscode(String passcode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // todo: encrypt passcode
    return await preferences.setString('passcode', passcode);
  }

  /// Check if the given passcode match the logged user passcode.
  Future<bool> checkPasscode(String passcode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String current = preferences.getString('passcode');
    // todo: decrypt passcode

    return passcode == current;
  }

  /// Delete user account from phone and clean storage.
  Future<bool> deleteAccount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('passcode');
    return await preferences.remove('user');
  }
}

UserService userService = UserService();
