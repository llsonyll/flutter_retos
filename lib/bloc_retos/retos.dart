import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reto {
  final String name;
  final String description;
  final IconData icon;
  final String route;
  final Color background;

  const Reto({
    @required this.name,
    @required this.description,
    this.icon = Icons.ac_unit,
    @required this.route,
    this.background = Colors.black,
  });
}

const List<Reto> retos = [
  Reto(
    name: 'Reto 1 => Grocery Store',
    description: 'Grocery Challengue - animations(drag)',
    icon: Icons.data_usage,
    route: 'GroceryChallengue',
    background: Colors.green,
  ),
  Reto(
    name: 'Reto 2 => StaggeredDualView|Flutter',
    description: 'Issue fixed for intersected views',
    icon: Icons.list_alt,
    route: 'StaggeredDualView',
    background: Colors.blueAccent,
  ),
  Reto(
    name: 'Reto 3 => SocialShareButton',
    description: 'Custom Widget | TweenAnimationBuilder',
    icon: Icons.phone_android_outlined,
    route: 'SocialShareButton',
    background: Colors.purple,
  ),
  Reto(
    name: 'Reto 4 => QRScanner, GoogleMaps, SQLite',
    description: 'Scan QR code and Maps',
    icon: Icons.map_outlined,
    route: 'QrScanner',
    background: Colors.orange,
  ),

  /* Reto(
    name: 'Reto 5 => LinkedInUI',
    description: 'Copy of a better UI for LinkedIn',
    icon: Icons.work_off_outlined,
    route: 'LinkedInUI',
    background: Colors.red,
  ),
  Reto(
    name: 'Reto 3 => TravelPhotosConcept',
    description: 'Diegoveloper',
    icon: Icons.data_usage,
    route: 'TravelPhotosConcept',
    background: Colors.black,
  ), */
];
