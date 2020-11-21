import 'package:flutter/material.dart';
import 'package:flutter_retos/reto1/home_reto.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter_retos',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        primaryColor: Colors.white,
      ),
      routes: {
        'home': (BuildContext context) => HomePage(),
        'reto_1': (BuildContext context) => HomeReto(),
      },
      initialRoute: 'home',
    );
  }
}
