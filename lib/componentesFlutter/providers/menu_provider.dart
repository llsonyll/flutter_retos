import 'package:flutter/services.dart' show rootBundle;

class MenuProvider {
  List<dynamic> opciones = [];

  MenuProvider() {
    cargarData();
  }

  cargarData() {
    rootBundle.loadString('../data.json').then((value) => print(value));
  }
}

final menuProvider = new MenuProvider();
