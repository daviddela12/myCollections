import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/navigation_notifier.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationBottomBarNotifier =
        Provider.of<NavigationNotifier>(context);

    return BottomNavigationBar(
      currentIndex: navigationBottomBarNotifier.getCurrentIndex,
      onTap: (index) => navigationBottomBarNotifier.updateCurrentIndex(index),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black45,
      selectedItemColor: Colors.blue.shade500,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Your Collection',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Categories',
        ),
      ],
    );
  }
}
