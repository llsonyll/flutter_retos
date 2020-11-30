import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class MainJWTLogin extends StatelessWidget {
  const MainJWTLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App NodeJS MongoDB',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences sharedPreferences;

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Login()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text(
          'JWT LOGIN',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (BuildContext context) => Login()),
                  (Route<dynamic> route) => false);
            },
            child: Text('Log Out'),
          ),
        ],
      ),
      body: Center(
        child: Text('Login'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text('sony_s07@hotmail.es'),
              accountName: Text('Josep Jairo'),
            ),
            ListTile(
              title: const Text('Inicio'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Medio'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Fin'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
