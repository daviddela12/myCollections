import 'package:flutter/material.dart';
import 'package:my_collections/src/elements/services/elements_service.dart';
import 'package:provider/provider.dart';

import '../../categories/views/categories_slug_view.dart';

class ElementsListView extends StatelessWidget {
  const ElementsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 60, top: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
    final elementsService = Provider.of<ElementsService>(context);

    final collectionElementsFiltered =
        elementsService.collectionElementsFiltered;

    return collectionElementsFiltered.isNotEmpty
        ? ListView.builder(
            itemCount: collectionElementsFiltered.length,
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
                  backgroundImage:
                      AssetImage(collectionElementsFiltered[index].imageAsset),
                ),
                title: Text(
                  collectionElementsFiltered[index].name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(collectionElementsFiltered[index].descriptionShort),
                      Text(
                          collectionElementsFiltered[index].createdAtFormatted),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      CategoriesSlugView(
                          categories:
                              collectionElementsFiltered[index].categories),
                    ]),
                trailing: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        collectionElementsFiltered[index].isFavouriteIcon,
                        color:
                            collectionElementsFiltered[index].isFavouriteColor,
                      ),
                      onPressed: () {
                        elementsService.toggleFavouriteStatus(
                            collectionElementsFiltered[index].getId);
                      },
                    ),
                  ],
                ),
              );
            })
        : const Center(child: Text("No elements found"));
  }
}
