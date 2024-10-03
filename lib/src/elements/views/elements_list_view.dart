import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_collections/src/elements/services/elements_service.dart';
import 'package:provider/provider.dart';

import '../../categories/views/categories_slug_view.dart';

class ElementsListView extends StatelessWidget {
  const ElementsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 60, top: 15),
      child: Column(children: [
        Text('Chronology of Elements', style: TextStyle(fontSize: 20)),
        _MyListView(),
      ]),
    );
  }
}

class _MyListView extends StatelessWidget {
  const _MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    final collectionElements =
        Provider.of<ElementsService>(context).collectionElements;

    return ListView.builder(
        itemCount: collectionElements.length,
        scrollDirection: Axis.vertical,
        shrinkWrap:
            true, //  Tells the ListView.builder to take only the height required for its content.
        itemBuilder: (context, index) {
          return ListTile(
            /**leading: CircleAvatar(
              radius: 25,
              child: Icon(
                collectionElements[index].icon,
                size: 15,
              ),
            ),**/
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(collectionElements[index].imageAsset),
            ),
            title: Text(
              collectionElements[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(collectionElements[index].description),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(DateFormat('yyyy-MM-dd')
                    .format(collectionElements[index].createdAt)),
                const Padding(padding: EdgeInsets.only(top: 5)),
                CategoriesSlugView(
                    categories: collectionElements[index].categories),
              ],
            ),
          );
        });
  }
}
