import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../categories/models/category_model.dart';

class ElementItem {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final String imageAsset;
  final DateTime createdAt;
  bool isFavourite;
  final List<Category> categories;

  ElementItem({
    String? id,
    required this.name,
    this.description = '',
    required this.icon,
    required this.imageAsset,
    DateTime? createdAt,
    this.isFavourite = false,
    this.categories = const [],
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  get categoriesNames => categories.map((category) => category.name).join(', ');

  get isFavouriteIcon => isFavourite ? Icons.star : Icons.star_border;

  get isFavouriteColor => isFavourite ? Colors.amber : Colors.grey;

  get descriptionShort => description.length > 100
      ? "${description.substring(0, 100)}..."
      : description;

  get createdAtFormatted =>
      "${createdAt.day}/${createdAt.month}/${createdAt.year}";

  get getId => id;
}
