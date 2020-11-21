import 'package:flutter/material.dart';

enum GroceryState {
  normal,
  details,
  cart,
}

class GroceryStoreBloc extends ChangeNotifier {
  GroceryState groceryState = GroceryState.normal;

  void changeToNormal() {
    groceryState = GroceryState.normal;
    notifyListeners();
  }

  void changeToCart() {
    groceryState = GroceryState.cart;
    notifyListeners();
  }
}
