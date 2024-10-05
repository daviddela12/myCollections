import 'package:flutter/material.dart';
import 'package:my_collections/src/categories/models/category_model.dart';
import 'package:provider/provider.dart';

import '../services/category_service.dart';

class CategoryAddFormView extends StatefulWidget {
  const CategoryAddFormView({super.key});

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryAddFormView> {
  final _nameController = TextEditingController();

  void _saveCategory() async {
    if (_nameController.text.isEmpty) return;

    final newCategory = Category(name: _nameController.text);
    await Provider.of<CategoryService>(context, listen: false)
        .insertCategory(newCategory);
    _nameController.clear();
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Category')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveCategory,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
