import 'package:flutter/material.dart';
import 'package:khanepani/pages/airline_page.dart';
import 'package:khanepani/pages/counter_page.dart';
import 'package:khanepani/pages/khanepani_page.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khanepani',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/khanepani': (context) => Khanepani(),
        '/airline': (context) => Airline(),
        '/counterPage': (context) => Counter(),
      },
    );
  }
}
