import 'package:knox/core/models/password.dart';
import 'package:knox/core/resources/storage.dart';

class PasswordService {
  List<Password> passwords = [];

  getPasswords() async {
    List tmp = await storage.get('passwords');
    passwords = tmp != null ? tmp.map((e) => Password.fromJson(e)).toList() : [];

    return passwords;
  }

  Future<bool> storePassword(Password password) async {
    try {
      await storage.store('passwords', password);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deletePassword(int index) async {
    try {
      bool deleted = await storage.delete('passwords', index);
      return deleted;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

PasswordService passwordService = PasswordService();
