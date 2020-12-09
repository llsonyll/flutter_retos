import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_retos/FlutterJWT/mainJWTLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPWT extends StatefulWidget {
  const LoginPWT({Key key}) : super(key: key);

  @override
  _LoginPWTState createState() => _LoginPWTState();
}

class _LoginPWTState extends State<LoginPWT> {
  bool _isLoading = false;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.teal],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    HeaderSection(),
                    TextFields(
                        emailController: emailController,
                        passwordController: passwordController),
                    /* button Area */
                    Container(
                      width: size.width,
                      height: 100.0,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: RaisedButton(
                        onPressed: emailController.text == "" ||
                                passwordController.text == ""
                            ? null
                            : () {
                                setState(() {
                                  _isLoading = true;
                                  signIn(emailController.text,
                                      passwordController.text);
                                });
                              },
                        child: Text(
                          'Ingresar',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        elevation: 0.0,
                        color: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ],
                )),
    );
  }

  signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': pass,
    };
    var response =
        await http.post('http://192.168.0.24:3000/signin', body: data);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => MainJWTLogin()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("App NodeJs Mongodb Login",
          style: TextStyle(
              color: Colors.white70,
              fontSize: 40.0,
              fontWeight: FontWeight.bold)),
    );
  }
}

class TextFields extends StatelessWidget {
  const TextFields({
    Key key,
    @required this.emailController,
    @required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              icon: Icon(Icons.mail, color: Colors.white),
              hintText: 'E-mail',
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 30),
          TextFormField(
            controller: passwordController,
            cursorColor: Colors.white,
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white),
              hintText: 'Password',
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
