import 'package:flutter/material.dart';

class PassengerProvider extends ChangeNotifier {
  Map<String, int> passenger = {};

  void updatePassengers(Map<String, int> updatedList) {
    passenger = updatedList;

    notifyListeners();
  }

  void initPassengers() {
    passenger = {
      'adult': 1,
      'child': 0,
    };

    notifyListeners();
  }
}
