import 'package:flutter/foundation.dart';
import 'package:knox/core/models/category.dart' as Models;
import 'package:knox/core/services/category_service.dart';

class CategoryProvider extends ChangeNotifier {
  List<Models.Category> categories = [];

  getCategories() async {
    categories = await categoryService.getCategories();
    notifyListeners();
  }
}
