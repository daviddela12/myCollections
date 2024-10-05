import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../categories/services/category_service.dart';
import '../models/element_item_model.dart';

class ElementsService with ChangeNotifier {
  final CategoryService categoryService;

  List<ElementItem> collectionElements = [];

  List<ElementItem> collectionElementsFiltered = [];

  ElementsService(this.categoryService) {
    collectionElements = [
      ElementItem(
          name: "All",
          description: "test description",
          icon: FontAwesomeIcons.list,
          imageAsset: 'assets/images/6.png',
          isFavourite: true,
          categories: [
            categoryService.categories[1],
          ]),
      ElementItem(
          name: "Favourites",
          description: "test description",
          icon: FontAwesomeIcons.star,
          imageAsset: 'assets/images/6.png'),
      ElementItem(
          name: "Carnivore",
          description: "test description",
          icon: FontAwesomeIcons.cloudMeatball,
          imageAsset: 'assets/images/6.png',
          isFavourite: true,
          categories: [categoryService.categories[1]]),
      ElementItem(
          name: "Herbivore",
          description: "test description",
          icon: FontAwesomeIcons.plantWilt,
          imageAsset: 'assets/images/6.png'),
    ];
    collectionElementsFiltered = collectionElements;
  }

  void toggleFavouriteStatus(String id) {
    final index = collectionElements.indexWhere((element) => element.id == id);
    if (index == -1) return;

    collectionElements[index].isFavourite =
        !collectionElements[index].isFavourite;

    getElementsByCategory(categoryService.selectedCategory);
  }

  getElementsByCategory(String categoryName) {
    switch (categoryName) {
      case "All":
        collectionElementsFiltered = collectionElements;
        break;
      case "Favourites":
        collectionElementsFiltered =
            collectionElements.where((element) => element.isFavourite).toList();
        break;
      default:
        collectionElementsFiltered = collectionElements
            .where((element) =>
                element.categories != null &&
                element.categories
                    .any((category) => category.name == categoryName))
            .toList();
        break;
    }
    notifyListeners();
  }
}
