/* import 'dart:html';
 */
import 'package:flutter/material.dart';
import 'package:flutter_retos/GroceryStoreChallengue/grocery_provider.dart';
import 'package:flutter_retos/GroceryStoreChallengue/grocery_store_bloc.dart';
import 'package:flutter_retos/GroceryStoreChallengue/grocery_store_cart.dart';
import 'package:flutter_retos/GroceryStoreChallengue/grocery_store_list.dart';

import 'grocery_product_details.dart';

const backgroundColor = Color(0xFFF6F5F2);
const cartBarHeight = 120.0;
const _panelTransition = Duration(milliseconds: 500);

class MainGroceryStoreChallengue extends StatefulWidget {
  const MainGroceryStoreChallengue({Key key}) : super(key: key);

  @override
  _MainGroceryStoreChallengueState createState() =>
      _MainGroceryStoreChallengueState();
}

class _MainGroceryStoreChallengueState
    extends State<MainGroceryStoreChallengue> {
  final bloc = GroceryStoreBloc();

  void _onVerticalGesture(DragUpdateDetails details) {
    print(details.primaryDelta);
    if (details.primaryDelta < -5) {
      bloc.changeToCart();
    } else {
      if (details.primaryDelta > 12) {
        bloc.changeToNormal();
      }
    }
  }

  double _getTopForRedPanel(GroceryState state, Size size) {
    /* funcion para controlar posicion por estado del panel rojo */
    if (state == GroceryState.normal) {
      return -cartBarHeight + kToolbarHeight;
    } else if (state == GroceryState.cart) {
      return -(size.height - kToolbarHeight - 150.0 / 2);
    }
    return 0;
  }

  double _getTopForBlackPanel(GroceryState state, Size size) {
    /* funcion para controlar posicion por estado del panel negro */
    if (state == GroceryState.normal) {
      return size.height - cartBarHeight;
    } else if (state == GroceryState.cart) {
      return cartBarHeight / 2;
    }
    return 0;
  }

  double _getTopForAppBar(GroceryState state) {
    /* funcion para controlar posicion por estado del panel negro */
    if (state == GroceryState.normal) {
      return 0.0;
    } else if (state == GroceryState.cart) {
      return -cartBarHeight;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: GroceryProvider(
        bloc: bloc,
        child: AnimatedBuilder(
          animation: bloc,
          builder: (context, _) => Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                AnimatedPositioned(
                  duration: _panelTransition,
                  curve: Curves.decelerate,
                  left: 0,
                  right: 0,
                  top: _getTopForRedPanel(bloc.groceryState, size),
                  height: size.height - kToolbarHeight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Container(
                      color: Colors.red,
                      child: GroceryStoreList(),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: _panelTransition,
                  curve: Curves.decelerate,
                  left: 0,
                  right: 0,
                  top: _getTopForBlackPanel(bloc.groceryState, size),
                  height: size.height - kToolbarHeight,
                  child: GestureDetector(
                    onVerticalDragUpdate: _onVerticalGesture,
                    child: Container(
                      color: Colors.black,
                      child: CartDetailArea(bloc: bloc),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: _panelTransition,
                  curve: Curves.decelerate,
                  left: 0,
                  right: 0,
                  top: _getTopForAppBar(bloc.groceryState),
                  child: GroceryAppBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartDetailArea extends StatelessWidget {
  const CartDetailArea({Key key, this.bloc}) : super(key: key);
  final GroceryStoreBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: AnimatedSwitcher(
            duration: _panelTransition,
            child: bloc.groceryState == GroceryState.normal
                ? SizedBox(
                    height: kToolbarHeight,
                    child: Row(
                      children: [
                        Text(
                          'Cart',
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                bloc.cart.length,
                                (index) => Stack(
                                  children: [
                                    Hero(
                                      tag:
                                          'list_${bloc.cart[index].product.name}details',
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage: AssetImage(
                                            bloc.cart[index].product.image),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.red,
                                        child: Text(
                                          bloc.cart[index].cantidadProductos
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          backgroundColor: customColor,
                          child: Text(
                            bloc.cart.length.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(height: 10),
          ),
        ),
        Expanded(child: GroceryStoreCart()),
      ],
    );
  }
}

class GroceryAppBar extends StatelessWidget {
  const GroceryAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Row(
        children: [
          BackButton(
            color: Colors.black,
            /* onPressed: () => Navigator.of(context).pop(), */
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Fruits and vegetables',
              style: TextStyle(color: Colors.black),
            ),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
