import 'package:flutter/material.dart';
import '../../categories/views/categories_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const CategoriesView(),
            Expanded(
              child: Container(
                color: Colors.blue,
                child: const Center(
                  child: Text('Home view'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
