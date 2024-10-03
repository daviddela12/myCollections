import 'package:flutter/material.dart';
import 'package:my_collections/src/navigation/notifiers/navigation_notifier.dart';
import 'package:my_collections/src/navigation/views/navigation_page_view.dart';
import 'package:provider/provider.dart';

class MyCollectionsView extends StatelessWidget {
  const MyCollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return ChangeNotifierProvider(
      create: (BuildContext context) => NavigationNotifier(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: const Align(
            alignment: Alignment.centerLeft,
            child: Text('My Collections',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert), // Three dots icon
              onPressed: () {
                // Define the action when the three dots icon is pressed
                print("Three dots pressed");
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Llevar al formulario
            /**
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormularioScreen()),
            );
                **/
          },
          child: const Icon(Icons.add),
        ),
        body: const NavigationPageView(),
        // bottomNavigationBar: const NavigationBottomBar(),
      ),
    );
  }
}
