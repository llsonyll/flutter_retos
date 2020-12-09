import 'package:flutter/material.dart';
import 'package:flutter_retos/componentesFlutter/providers/menu_provider.dart';

class HomeComponentes extends StatelessWidget {
  const HomeComponentes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(menuProvider.opciones);
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
