import 'package:flutter/material.dart';
import 'package:my_collections/src/categories/views/category_form_view.dart';
import 'package:my_collections/src/common/views/my_app_bar.dart';
import 'package:my_collections/src/navigation/notifiers/navigation_notifier.dart';
import 'package:my_collections/src/navigation/views/navigation_page_view.dart';
import 'package:provider/provider.dart';

class MyCollectionsView extends StatelessWidget {
  const MyCollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return ChangeNotifierProvider(
      create: (BuildContext context) => NavigationNotifier(),
      child: Scaffold(
        appBar: const MyAppBar(title: 'My Collections'),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CategoryFormView()),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: const NavigationPageView(),
        // bottomNavigationBar: const NavigationBottomBar(),
      ),
    );
  }
}
