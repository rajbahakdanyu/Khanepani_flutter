import 'package:flutter/material.dart';

class PassengerProvider extends ChangeNotifier {
  Map<String, int> passenger = {
    'adult': 1,
    'child': 0,
  };
}
