import 'package:flutter/material.dart';
import 'package:flutter_retos/GroceryStoreChallengue/main_grocery_store_challengue.dart';
import 'package:flutter_retos/StaggeredDualView/main_staggered_dual_view.dart';
import 'package:flutter_retos/home.dart';
import 'package:google_fonts/google_fonts.dart';

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
        'GroceryChallengue': (BuildContext context) =>
            MainGroceryStoreChallengue(),
        'StaggeredDualView': (BuildContext context) => MainStaggeredDualView(),
      },
      initialRoute: 'home',
    );
  }
}
