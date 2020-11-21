import 'package:flutter/material.dart';
import 'package:flutter_retos/GroceryStoreChallengue/grocery_product.dart';

enum GroceryState {
  normal,
  details,
  cart,
}

class GroceryStoreBloc extends ChangeNotifier {
  GroceryState groceryState = GroceryState.normal;
  /* Al ser un catalogo no se deberian modificar */
  List<GroceryProduct> productos = List.unmodifiable(groceryProducts);

  void changeToNormal() {
    groceryState = GroceryState.normal;
    notifyListeners();
  }

  void changeToCart() {
    groceryState = GroceryState.cart;
    notifyListeners();
  }
}
