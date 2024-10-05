import 'package:flutter/material.dart';
import 'package:my_collections/src/categories/services/category_service.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context, listen: true);

    final categories = categoryService.categories;

    final selectedCategory = categoryService.selectedCategory;

    if (categories.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    // Método para mostrar el popup con la opción de eliminar
    void _showPopupMenu(int index, Offset offset) async {
      await showMenu(
        context: context,
        position:
            RelativeRect.fromLTRB(offset.dx, offset.dy, offset.dx, offset.dy),
        items: [
          const PopupMenuItem(
            value: 'delete',
            child: Text('Delete'),
          ),
        ],
        elevation: 8.0,
      ).then((value) async {
        if (value == 'delete') {
          await categoryService.deleteCategory(index);
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Item deleted'),
            ));
          }
        }
      });
    }

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
                    categoryService.selectCategory(
                        context, categories[index].name);
                  },
                  onLongPressStart: (details) {
                    if (categories[index].name == 'All' ||
                        categories[index].name == 'Favourites') {
                      return;
                    }
                    _showPopupMenu(index, details.globalPosition);
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
                              top: 5, bottom: 5, left: 15, right: 15),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: (categories[index].name == selectedCategory)
                                ? Colors.blue.shade900
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.blue.shade900,
                              width: 2.0,
                            ),
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
