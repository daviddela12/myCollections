import 'package:flutter/material.dart';

class HomeItemView extends StatelessWidget {
  const HomeItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(children: [
        Text('Header Section'),
        _ItemView(),
      ]),
    );
  }
}

class _ItemView extends StatelessWidget {
  const _ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        shrinkWrap:
            true, //  Tells the ListView.builder to take only the height required for its content.
        itemBuilder: (context, index) {
          return const ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: Icon(
                Icons.ice_skating,
                size: 15,
              ),
            ),
            title: Text(
              'Contact Name Here',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Last message or status here'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('12:00 PM'), // Time of the last message
              ],
            ),
          );
        });
  }
}
