import 'package:knox/core/models/category.dart';
import 'package:knox/core/resources/storage.dart';

class CategoryService {
  List<Category> categories = [];

  getCategories() async {
    List tmp = await storage.get('categories');
    categories = tmp.map((e) => Category.fromJson(e)).toList();

    return categories;
  }

  Future<bool> storeCategory(Category category) async {
    try {
      await storage.store('categories', category);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteCategory(int index) async {
    try {
      bool deleted = await storage.delete('categories', index);
      return deleted;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

CategoryService categoryService = CategoryService();
