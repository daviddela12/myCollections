import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/navigation_notifier.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({super.key});

  @override
  Widget build(BuildContext context) {

    final navigationBottomBarNotifier = Provider.of<NavigationNotifier>(context);

    return BottomNavigationBar(
      currentIndex: navigationBottomBarNotifier.getCurrentIndex,
      onTap: (index) => navigationBottomBarNotifier.updateCurrentIndex(index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Your Collection',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Favs',
        ),
      ],
    );
  }
}
