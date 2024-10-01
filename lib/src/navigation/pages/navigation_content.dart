import 'package:flutter/material.dart';
import 'package:my_collections/src/categories/pages/tab_elements/tab_elements.dart';

class NavigationContent extends StatelessWidget {
  const NavigationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      // physics: const AlwaysScrollableScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        const TabElements(),
        Container(
          color: Colors.blue,
          child: const Center(
            child: Text('Borrar 1'),
          ),
        ),
        Container(
          color: Colors.black,
          child: const Center(
            child: Text('Borrar 2'),
          ),
        ),
      ],
    );
  }
}
