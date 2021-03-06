import 'package:flutter/material.dart';
import 'package:flutter_retos/BounceTabBar/main_bounce_tab_bar.dart';
import 'package:flutter_retos/GroceryStoreChallengue/main_grocery_store_challengue.dart';
import 'package:flutter_retos/LinkedIn/main_linked_in.dart';
import 'package:flutter_retos/SocialShareButton/mainSocialShareButton.dart';
import 'package:flutter_retos/StaggeredDualView/main_staggered_dual_view.dart';
import 'package:flutter_retos/TravelPhotosConcept/main_travel_photos.dart';
import 'package:flutter_retos/home.dart';
import 'package:google_fonts/google_fonts.dart';

import 'FlutterJWT/mainJWTLogin.dart';
import 'QrScanner/MainQrScanner.dart';

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
        'TravelPhotosConcept': (BuildContext context) =>
            MainTravelPhotosConcept(),
        'SocialShareButton': (BuildContext context) => MainSocialShareButton(),
        'LinkedInUI': (BuildContext context) => MainLinkedIn(),
        'QrScanner': (BuildContext context) => MainQrScanner(),
        'JWTlogin': (BuildContext context) => MainJWTLogin(),
        'BounceTabBar': (BuildContext context) => MainBounceTabBar(),
      },
      initialRoute: 'home',
    );
  }
}
