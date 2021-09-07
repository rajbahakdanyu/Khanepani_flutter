import 'package:flutter/material.dart';
import 'package:khanepani/providers/passenger_provider.dart';
import 'package:provider/provider.dart';

import 'pages/airline_page.dart';
import 'pages/airports_page.dart';
import 'pages/counter_page.dart';
import 'pages/khanepani_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: PassengerProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
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
        '/counter': (context) => Counter(),
        '/airport': (context) => Airport(),
      },
    );
  }
}
