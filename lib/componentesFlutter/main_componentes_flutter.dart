import 'package:flutter/material.dart';
import 'package:flutter_retos/componentesFlutter/pages/home.dart';

class MainComponenteFlutter extends StatelessWidget {
  const MainComponenteFlutter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeComponentes(),
    );
  }
}
