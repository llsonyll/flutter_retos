import 'package:flutter/material.dart';

class GroceryStoreList extends StatelessWidget {
  const GroceryStoreList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Container(
        height: 100,
        width: 100,
        color: Colors.primaries[index % Colors.primaries.length],
      ),
    );
  }
}
