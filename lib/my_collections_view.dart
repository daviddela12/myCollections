import 'package:flutter/material.dart';
import 'package:my_collections/src/navigation/pages/navigation_bottom_bar.dart';
import 'package:my_collections/src/navigation/pages/navigation_content.dart';

class MyCollectionsView extends StatelessWidget {
  const MyCollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return const Scaffold(
      body: NavigationContent(),
      bottomNavigationBar: NavigationBottomBar(),
    );
  }
}


