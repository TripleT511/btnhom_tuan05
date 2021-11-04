import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPagePageState();
}

class _LoginPagePageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Widget _btnLogin = Container(
      margin: const EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 0),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.all(10.0),
            minimumSize: const Size(500, 60),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero))),
        child: const Text(
          "SIGN IN",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    Widget _logo = Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Image.asset(
        'images/1.png',
        width: 180,
        height: 180,
        fit: BoxFit.cover,
      ),
    );
    Widget _title = Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: const Text(
        'SignIn',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40.0,
        ),
      ),
    );
    Widget _title2 = Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: const Text(
        'Speak, friend and enter',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
    Widget _inputSection = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          child: const TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              hintText: 'Password',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          child: const TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              hintText: 'Email',
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.blue.shade500,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[_logo, _title, _title2, _inputSection, _btnLogin],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
