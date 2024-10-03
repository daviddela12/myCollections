import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoriesSlugView extends StatelessWidget {
  final List<Category> categories;

  const CategoriesSlugView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return (categories.isNotEmpty)
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(categories.map((category) => category.name).join(', ')),
          )
        : const SizedBox.shrink();
  }
}
