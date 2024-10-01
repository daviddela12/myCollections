import 'package:flutter/material.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Your Collection',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Borrar 1',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Borrar 2',
        ),
      ],
    );
  }
}
