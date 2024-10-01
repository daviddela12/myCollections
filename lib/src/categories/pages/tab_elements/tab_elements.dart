import 'package:flutter/material.dart';
import 'package:my_collections/src/categories/services/category_service.dart';
import 'package:provider/provider.dart';

class TabElements extends StatelessWidget {
  const TabElements({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoryService>(context).categories;

    return SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 80,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Text(categories[index].name);
                    }
                ),
              ),
            ],
          ),
        ),
    );
  }
}
