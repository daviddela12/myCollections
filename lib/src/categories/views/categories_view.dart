import 'package:flutter/material.dart';
import 'package:my_collections/src/categories/services/category_service.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoryService>(context).categories;

    return Container(
      child: SizedBox(
        height: 60,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return MouseRegion(
                cursor:
                    SystemMouseCursors.click, // Change the cursor to a pointer
                child: GestureDetector(
                  onTap: () {
                    print('Category: ${categories[index].name}');
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: <Widget>[
                        /**CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.amber,
                          child: Icon(
                            categories[index].icon,
                            size: 15,
                          ),
                        ),**/
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: 15,
                              right: 15), // Adds padding inside the container
                          margin: const EdgeInsets.all(
                              5), // Adds margin outside the container
                          decoration: BoxDecoration(
                            color: Colors.blue
                                .shade300, // Background color of the container
                            borderRadius:
                                BorderRadius.circular(5), // Rounded edges
                          ),
                          child: Text(
                            categories[index].name,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
