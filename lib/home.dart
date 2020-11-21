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
                          .copyWith(color: Colors.red),
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
                        Navigator.of(context).pushNamed('reto_1');
                      },
                      title: Text(
                        'Reto 1',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.purpleAccent),
                      ),
                      subtitle: Text(
                        'Grocery Challengue - animations(drag)',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.white),
                      ),
                      tileColor: Colors.purple,
                      trailing: Icon(
                        Icons.ac_unit,
                        color: Colors.purpleAccent,
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
