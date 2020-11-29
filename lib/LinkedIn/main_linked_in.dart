import 'package:flutter/material.dart';

class MainLinkedIn extends StatelessWidget {
  const MainLinkedIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
