import 'package:flutter/material.dart';

import 'grocery_product_details.dart';
import 'grocery_provider.dart';

class GroceryStoreCart extends StatelessWidget {
  const GroceryStoreCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;
    return bloc.cart.length > 0
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                      itemCount: bloc.cart.length,
                      itemBuilder: (context, index) {
                        final item = bloc.cart[index];
                        return Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(item.product.image),
                            ),
                            SizedBox(width: 10),
                            CircleAvatar(
                              radius: 12,
                              child: Text(
                                item.cantidadProductos.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.grey[700],
                            ),
                            SizedBox(width: 10),
                            Text(
                              'x',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Text(
                              item.product.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              item.product.price.toStringAsFixed(2),
                              style: TextStyle(color: Colors.white54),
                            ),
                            IconButton(
                                icon: Icon(Icons.delete, color: Colors.white),
                                onPressed: () {
                                  bloc.removeProduct(item);
                                }),
                          ],
                        );
                      }),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 21,
                        ),
                      ),
                      Text(
                        bloc.totalCartAmount().toStringAsFixed(2),
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    bloc.changeToNormal();
                  },
                  color: customColor,
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Carrito vació',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    bloc.changeToNormal();
                  },
                  color: customColor,
                  child: Text(
                    'Comprar',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          );
  }
}
