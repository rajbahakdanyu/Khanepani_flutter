import 'package:flutter/material.dart';

class PassengerProvider extends ChangeNotifier {
  Map<String, int> passenger = {};

  int get totalPassengers {
    int total = 0;

    passenger.forEach((key, value) {
      total += value;
    });

    return total;
  }

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
