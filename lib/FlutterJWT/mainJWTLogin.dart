import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UI/listProducts.dart';
import 'UI/login.dart';

class MainJWTLogin extends StatelessWidget {
  const MainJWTLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App NodeJS MongoDB',
      theme: ThemeData(),
      home: HomePWT(),
    );
  }
}

class HomePWT extends StatefulWidget {
  const HomePWT({Key key}) : super(key: key);

  @override
  _HomePWTState createState() => _HomePWTState();
}

class _HomePWTState extends State<HomePWT> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPWT()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'JWT LOGIN',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            FlatButton(
              onPressed: () {
                sharedPreferences.clear();
                /* sharedPreferences.commit(); */
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPWT()),
                    (Route<dynamic> route) => false);
              },
              child: Text(
                'Log Out',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.cyanAccent),
              ),
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LoginPWT()));
                },
              ),
              ListTile(
                title: const Text('Productos'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ListProducts()));
                },
              ),
              ListTile(
                title: const Text('Fin'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
