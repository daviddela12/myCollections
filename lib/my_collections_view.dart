import 'package:flutter/material.dart';
import 'package:my_collections/src/navigation/notifiers/navigation_notifier.dart';
import 'package:my_collections/src/navigation/views/navigation_bottom_bar.dart';
import 'package:my_collections/src/navigation/views/navigation_page_view.dart';
import 'package:provider/provider.dart';

class MyCollectionsView extends StatelessWidget {
  const MyCollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return ChangeNotifierProvider(
      create: (BuildContext context) => NavigationNotifier(),
      child: const Scaffold(
        body: NavigationPageView(),
        bottomNavigationBar: NavigationBottomBar(),
      ),
    );
  }
}
