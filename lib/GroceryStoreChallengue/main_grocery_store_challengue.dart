import 'package:flutter/material.dart';
import 'package:flutter_retos/GroceryStoreChallengue/grocery_provider.dart';
import 'package:flutter_retos/GroceryStoreChallengue/grocery_store_bloc.dart';
import 'package:flutter_retos/GroceryStoreChallengue/grocery_store_list.dart';

const _backgroundColor = Color(0xFFF6F5F2);
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
      return -cartBarHeight;
    } else if (state == GroceryState.cart) {
      return -(size.height - kToolbarHeight - 150.0 / 2);
    }
    return 0;
  }

  double _getTopForBlackPanel(GroceryState state, Size size) {
    /* funcion para controlar posicion por estado del panel negro */
    if (state == GroceryState.normal) {
      return size.height - kToolbarHeight - cartBarHeight;
    } else if (state == GroceryState.cart) {
      return cartBarHeight / 2;
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
            body: Column(
              children: [
                GroceryAppBar(),
                Expanded(
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: _panelTransition,
                        curve: Curves.decelerate,
                        left: 0,
                        right: 0,
                        top: _getTopForRedPanel(bloc.groceryState, size),
                        height: size.height - kToolbarHeight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: GroceryStoreList(),
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GroceryAppBar extends StatelessWidget {
  const GroceryAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: Row(
        children: [
          BackButton(
            color: Colors.black,
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
