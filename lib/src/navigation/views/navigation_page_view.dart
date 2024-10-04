import 'package:flutter/material.dart';
import 'package:my_collections/src/home/views/home_view.dart';
import 'package:provider/provider.dart';

import '../notifiers/navigation_notifier.dart';

class NavigationPageView extends StatelessWidget {
  const NavigationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationBottomBarNotifier =
        Provider.of<NavigationNotifier>(context);

    return PageView(
      controller: navigationBottomBarNotifier.getPageController,
      // physics: const AlwaysScrollableScrollPhysics(),
      // physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: const <Widget>[
        HomeView(),
      ],
    );
  }
}
