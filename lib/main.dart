import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
  final email = TextEditingController();
  final password = TextEditingController();
  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MailPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _btnLogin = Container(
      margin: const EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 0),
      child: TextButton(
        onPressed: () {
          if (email.text == "" || password.text == "") {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Thông báo'),
                    content: const Text('Chưa nhập thông tin'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Đóng'),
                      ),
                    ],
                  );
                });
          } else if (email.text != password.text) {
            // Login failed
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoadingPage()),
            );
            startTimer();
          }
        },
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
        'images/Logo_01.png',
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
    Widget _title = Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: const Text(
        'SignIn',
        style: TextStyle(
          color: Colors.white,
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
          fontSize: 18.0,
        ),
      ),
    );
    Widget _inputSection = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: email,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              hintText: 'Email',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: password,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              hintText: 'Password',
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade400,
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

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _logo = Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Image.asset(
        'images/Logo_01.png',
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
    Widget _title = Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: const Text(
        'SignIn',
        style: TextStyle(
          color: Colors.white,
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
          fontSize: 18.0,
        ),
      ),
    );
    Widget _loading = Container(
      margin: const EdgeInsets.only(top: 50.0),
      child: const SpinKitRing(color: Colors.white),
    );
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade400,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[_logo, _title, _title2, _loading],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MailPage extends StatelessWidget {
  const MailPage({Key? key}) : super(key: key);

  Container buildF(IconData i, double pad, String str) {
    int randN = Random().nextInt(100);
    bool value1 = false;
    bool value2 = false;
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Checkbox(
            value: value1,
            onChanged: (value2) {
              value1 = true;
            },
          ),
          Icon(
            i,
            color: Colors.blueAccent,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: Colors.grey.shade200, width: 1.0))),
            child: Text(
              str,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: pad, bottom: 10),
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: Colors.grey.shade200, width: 1.0))),
            child: Text(
              '$randN',
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mail'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                  color: Colors.grey.shade200,
                  child: const Text('Mailboxes'),
                ),
                buildF(Icons.inbox, 300, 'All Inboxes'),
                buildF(Icons.cloud, 328, 'ICloud'),
                buildF(Icons.mail_outline, 330, 'Gmail'),
                buildF(Icons.mail, 315, 'Hot Mail'),
                buildF(Icons.star, 345, 'Vip'),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                  color: Colors.grey.shade200,
                  child: const Text('Special folder'),
                ),
                buildF(Icons.security, 317, 'Sercure'),
                buildF(Icons.notification_add, 292, 'Nofications'),
              ],
            ),
          ),
        ));
  }
}
