import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../categories/services/category_service.dart';
import '../models/element_item_model.dart';

class ElementsService with ChangeNotifier {
  final CategoryService categoryService;
  List<ElementItem> collectionElements = [];

  ElementsService(this.categoryService) {
    collectionElements = [
      ElementItem(
          name: "All",
          description: "test description",
          icon: FontAwesomeIcons.list,
          imageAsset: 'assets/images/6.png',
          categories: [
            categoryService.categories[0],
            categoryService.categories[1],
            categoryService.categories[2],
            categoryService.categories[3]
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
          categories: [
            categoryService.categories[0],
            categoryService.categories[1]
          ]),
      ElementItem(
          name: "Herbivore",
          description: "test description",
          icon: FontAwesomeIcons.plantWilt,
          imageAsset: 'assets/images/6.png'),
    ];
  }
}
