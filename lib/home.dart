import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                height: size.height * .2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Retos',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.black),
                    ),
                    Text('Josep "Nice⌐"',
                        style: Theme.of(context).textTheme.headline6),
                    Text('App para retos y locuras de prueba'),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed('GroceryChallengue');
                      },
                      title: Text(
                        'Reto 1 - Grocery Store',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Grocery Challengue - animations(drag)',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.white),
                      ),
                      tileColor: Colors.green[800],
                      trailing: Icon(
                        Icons.ac_unit,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed('StaggeredDualView');
                      },
                      title: Text(
                        'Reto 2 -> StaggeredDualView | Flutter Custom Widget',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.white),
                      ),
                      subtitle: Text(
                        '28 ago. 2020 - Diegoveloper',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.white),
                      ),
                      tileColor: Colors.blue,
                      trailing: Icon(
                        Icons.ac_unit,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
