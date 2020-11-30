import 'package:flutter/material.dart';

import 'bloc_retos/retos.dart';

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
                child: ListView.builder(
                  itemCount: retos.length,
                  itemBuilder: (context, index) {
                    final reto = retos[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed(reto.route);
                        },
                        title: Text(
                          reto.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white),
                        ),
                        subtitle: Text(
                          reto.description,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.white),
                        ),
                        tileColor: reto.background,
                        trailing: Icon(
                          reto.icon,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
