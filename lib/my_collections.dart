import 'package:flutter/material.dart';
import 'package:my_collections/my_collections_view.dart';
import 'package:my_collections/conf/themes/dark.dart';

class MyCollections extends StatelessWidget {
  const MyCollections({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const MyCollectionsView(),
      theme: darkTheme,
    );
  }
}
