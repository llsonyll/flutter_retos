import 'package:flutter/material.dart';

class MainTravelPhotosConcept extends StatelessWidget {
  const MainTravelPhotosConcept({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Travel Photos Concept',
          style: Theme.of(context)
              .textTheme
              .headline1
              .copyWith(color: Colors.lightGreen),
        ),
      ),
    );
  }
}
