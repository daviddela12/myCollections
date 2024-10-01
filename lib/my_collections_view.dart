import 'package:flutter/material.dart';
import 'package:my_collections/src/navigation/views/navigation_bottom_bar.dart';
import 'package:my_collections/src/navigation/views/navigation_page_views.dart';

class MyCollectionsView extends StatelessWidget {
  const MyCollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return const Scaffold(
      body: NavigationPageViews(),
      bottomNavigationBar: NavigationBottomBar(),
    );
  }
}


