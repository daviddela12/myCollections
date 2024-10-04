import 'package:my_collections/src/categories/models/category_model.dart';

import '../../common/services/database_helper.dart';

class CategoryCrud {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<int> insertCategory(Category category) async {
    final db = await _dbHelper.database;
    print("Inserting category: ${category.toMap()}");
    return await db.insert('category', category.toMap());
  }

  Future<List<Category>> getCategories() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('category');
    return List.generate(maps.length, (i) {
      return Category.fromMap(maps[i]);
    });
  }

  Future<int> updateCategory(Category category) async {
    final db = await _dbHelper.database;
    return await db.update(
      'category',
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  Future<int> deleteCategory(String id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      'category',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
