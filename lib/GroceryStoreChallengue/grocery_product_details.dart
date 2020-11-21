import 'package:flutter/material.dart';
import 'package:flutter_retos/GroceryStoreChallengue/grocery_product.dart';

class GroceryProductDetails extends StatelessWidget {
  const GroceryProductDetails({Key key, @required this.producto})
      : super(key: key);
  final GroceryProduct producto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: Center(
        child: Hero(
          tag: 'list_${producto.name}',
          child: Image.asset(
            producto.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
