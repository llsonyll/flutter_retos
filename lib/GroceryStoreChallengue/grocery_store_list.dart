import 'package:flutter/material.dart';
import 'package:flutter_retos/GroceryStoreChallengue/grocery_provider.dart';

import 'main_grocery_store_challengue.dart';

class GroceryStoreList extends StatelessWidget {
  const GroceryStoreList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;
    return ListView.builder(
      padding: EdgeInsets.only(top: cartBarHeight),
      itemCount: bloc.productos.length,
      itemBuilder: (context, index) => Container(
        height: 100,
        width: 100,
        color: Colors.primaries[index % Colors.primaries.length],
      ),
    );
  }
}
