import 'package:flutter/material.dart';

import '../../categories/views/category_add_form_view.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black45,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      actions: [
        PopupMenuButton<String>(
          onSelected: (String result) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CategoryAddFormView()),
            );
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Add Category',
              child: Text('Add Category'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
