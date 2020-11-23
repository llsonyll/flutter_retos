import 'package:flutter/material.dart';
import 'package:flutter_retos/GroceryStoreChallengue/grocery_product_details.dart';
import 'package:flutter_retos/GroceryStoreChallengue/grocery_provider.dart';
import 'package:flutter_retos/StaggeredDualView/main_staggered_dual_view.dart';

import 'main_grocery_store_challengue.dart';

class GroceryStoreList extends StatelessWidget {
  const GroceryStoreList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.only(
          top: cartBarHeight, left: 20, right: 20, bottom: cartBarHeight / 2.5),
      child: StaggeredDualView(
        percentDesnivel: 0.3,
        spacing: 20,
        aspectRatio: 0.8,
        itemBuilder: (context, index) {
          final producto = bloc.productos[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 900),
                  pageBuilder: (context, animation, _) => FadeTransition(
                      child: GroceryProductDetails(
                        producto: producto,
                        onProductAdd: () {
                          bloc.addProduct(producto);
                        },
                      ),
                      opacity: animation),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Expanded(
                      child: Hero(
                        tag: 'list_${producto.name}',
                        child: Image.asset(
                          bloc.productos[index].image,
                          fit: BoxFit.contain,
                          height: 100,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      bloc.productos[index].name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bloc.productos[index].description,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      '\$${bloc.productos[index].price}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: bloc.productos.length,
      ),
    );

    /* ListView.builder(
      padding: EdgeInsets.only(top: cartBarHeight),
      itemCount: bloc.productos.length,
      itemBuilder: (context, index) => Container(
        height: 100,
        width: 100,
        color: Colors.primaries[index % Colors.primaries.length],
      ),
    ); */
  }
}
