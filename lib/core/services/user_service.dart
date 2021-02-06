import 'dart:convert';

import 'package:knox/core/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<bool> createAccount(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.remove('user');
    return await preferences.setString('user', jsonEncode(user.toJson()));
  }

  Future getAccount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    User user;

    String json = preferences.getString('user');
    if (json != null) user = User.fromJson(jsonDecode(json));

    return user;
  }

  Future<bool> setPasscode(String passcode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // todo: encrypt passcode
    return await preferences.setString('passcode', passcode);
  }

  // migrate this to checkPasscode() to check hashed passcode
  Future<bool> checkPasscode(String passcode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String current = preferences.getString('passcode');
    // todo: decrypt passcode

    return passcode == current;
  }

  Future<bool> deleteAccount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('passcode');
    return await preferences.remove('user');
  }
}

UserService userService = UserService();
