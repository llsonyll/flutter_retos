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
  List<GroceryProductItem> cart = [];

  void changeToNormal() {
    groceryState = GroceryState.normal;
    notifyListeners();
  }

  void changeToCart() {
    groceryState = GroceryState.cart;
    notifyListeners();
  }

  void addProduct(GroceryProduct producto) {
    for (GroceryProductItem item in cart) {
      if (item.product.name == producto.name) {
        item.increment();
        notifyListeners();
        return;
      }
    }
    cart.add(GroceryProductItem(product: producto));
    notifyListeners();
  }

  void removeProduct(GroceryProductItem producto) {
    cart.remove(producto);
    notifyListeners();
  }

  int totalCartElements() => cart.fold(
      0, (previousValue, element) => previousValue + element.cantidadProductos);

  double totalCartAmount() => cart.fold(
        0,
        (previousValue, element) => (previousValue +
            (element.cantidadProductos * element.product.price)),
      );
}

/* COMPRAS */
class GroceryProductItem {
  GroceryProductItem({this.cantidadProductos = 1, @required this.product});
  int cantidadProductos;
  final GroceryProduct product;

  void increment() {
    cantidadProductos++;
  }

  void decrement() {}
}
