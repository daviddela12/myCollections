import 'package:flutter/material.dart';

import '../../categories/models/category_model.dart';

class ElementItem {
  final String name;
  final String description;
  final IconData icon;
  final String imageAsset;
  final DateTime createdAt;
  final bool isFavourite;
  final List<Category> categories;

  ElementItem({
    required this.name,
    this.description = '',
    required this.icon,
    required this.imageAsset,
    DateTime? createdAt,
    this.isFavourite = false,
    this.categories = const [],
  }) : createdAt = createdAt ?? DateTime.now();
}
