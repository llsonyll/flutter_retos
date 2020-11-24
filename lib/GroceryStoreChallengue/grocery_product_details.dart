/* import 'dart:html'; */

import 'package:flutter/material.dart';
import 'package:flutter_retos/GroceryStoreChallengue/grocery_product.dart';

final customColor = Colors.yellow[700];

class GroceryProductDetails extends StatefulWidget {
  const GroceryProductDetails(
      {Key key, @required this.producto, this.onProductAdd})
      : super(key: key);
  final GroceryProduct producto;
  final VoidCallback onProductAdd;

  @override
  _GroceryProductDetailsState createState() => _GroceryProductDetailsState();
}

class _GroceryProductDetailsState extends State<GroceryProductDetails> {
  String heroTag = '';

  void addToCart(BuildContext context) {
    setState(() {
      heroTag = 'details';
    });
    widget.onProductAdd();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: 'list_${widget.producto.name}$heroTag',
                    child: Image.asset(
                      widget.producto.image,
                      fit: BoxFit.cover,
                      height: size.height * 0.3,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.producto.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                  ),
                  Text(
                    widget.producto.weight,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Colors.black26),
                  ),
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                                onPressed: null),
                            Text(
                              '1',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                                onPressed: null),
                          ],
                        ),
                      ),
                      Text(
                        'S/${widget.producto.price}',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'About the product',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.producto.description,
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: Icon(Icons.favorite_border_outlined),
                ),
                FlatButton(
                  onPressed: () => addToCart(context),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  color: customColor,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
