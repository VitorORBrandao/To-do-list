
import 'package:flutter/material.dart';
import 'myHome.dart';
import 'login.dart';
import 'register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tod-Do List',
      theme: ThemeData(primarySwatch: Colors.teal, scaffoldBackgroundColor: const Color.fromRGBO(31, 25, 47, 100)),
      initialRoute: '/',
      routes: {
        '/': (context) => MyLogin(tasks: []),
        '/home': (context) => MyHome(tasks: [],currentUser: 0),
        '/register': (context) => MyRegister(tasks: []),
      },
    );
  }
}
