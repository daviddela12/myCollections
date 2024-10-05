import 'package:flutter/material.dart';
import '../../carousel/views/carousel_view.dart';
import '../../categories/views/categories_view.dart';
import '../../elements/views/elements_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
            padding:
                EdgeInsets.all(5.0), // Adds padding of 16 pixels on all sides
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CategoriesView(),
                  /**const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),**/
                  CarouselView(),
                  ElementsListView(),
                ],
              ),
            )),
      ),
    );
  }
}
