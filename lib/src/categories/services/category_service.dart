import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/category_model.dart';

class CategoryService with ChangeNotifier {
  List<Category> categories = [
      const Category(name: "All", icon: FontAwesomeIcons.list),
      const Category(name: "Favourites", icon: FontAwesomeIcons.star),
      const Category(name: "Carnivore", icon: FontAwesomeIcons.cloudMeatball),
      const Category(name: "Herbivore", icon: FontAwesomeIcons.plantWilt),
    ];
}
