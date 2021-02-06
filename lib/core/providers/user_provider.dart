import 'package:flutter/foundation.dart';
import 'package:knox/core/models/user.dart';
import 'package:knox/core/services/user_service.dart';

class UserProvider extends ChangeNotifier {
  User user;

  getUser() async {
    user = await userService.getAccount();
    notifyListeners();
  }
}
