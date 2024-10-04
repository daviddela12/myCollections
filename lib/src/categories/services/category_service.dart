import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../elements/services/elements_service.dart';
import '../models/category_model.dart';
import 'category_crud.dart';

class CategoryService with ChangeNotifier {
  List<Category> categories = [
    Category(name: "All", icon: FontAwesomeIcons.list),
    Category(name: "Favourites", icon: FontAwesomeIcons.star),
    // Category(name: "Carnivore", icon: FontAwesomeIcons.cloudMeatball),
    // Category(name: "Herbivore", icon: FontAwesomeIcons.plantWilt),
  ];

  String _selectedCategory = "All";

  CategoryService() {
    _initializeCategories();
  }

  String get selectedCategory => _selectedCategory;

  _initializeCategories() async {
    final categoryCrud = CategoryCrud();
    final dbCategories = await categoryCrud.getCategories();
    categories = categories + dbCategories;

    notifyListeners();
  }

  insertCategory(Category category) async {
    final categoryCrud = CategoryCrud();
    await categoryCrud.insertCategory(category);

    categories.add(category);

    notifyListeners();
  }

  deleteCategory(int index) async {
    final categoryCrud = CategoryCrud();
    await categoryCrud.deleteCategory(categories[index].id!);

    categories.removeAt(index);

    notifyListeners();
  }

  selectCategory(BuildContext context, String categoryName) {
    _selectedCategory = categoryName;

    context.read<ElementsService>().getElementsByCategory(categoryName);

    notifyListeners();
  }
}
