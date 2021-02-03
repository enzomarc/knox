import 'package:flutter/foundation.dart';
import 'package:knox/core/models/password.dart' as Models;
import 'package:knox/core/services/password_service.dart';

class PasswordProvider extends ChangeNotifier {
  List<Models.Password> passwords = [];

  getPasswords() async {
    passwords = await passwordService.getPasswords();
    notifyListeners();
  }
}
