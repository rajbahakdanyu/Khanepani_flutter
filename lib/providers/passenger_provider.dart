import 'package:flutter/material.dart';

class PassengerProvider extends ChangeNotifier {
  int adult = 0;
  int child = 0;

  void initPassengers() {
    child = 0;
    adult = 1;
  }

  int get totalPassengers {
    int total = adult + child;

    return total;
  }

  int get getAdult => adult;

  int get getChild => child;

  void increaseAdult() {
    adult++;

    notifyListeners();
  }

  void increaseChild() {
    child++;

    notifyListeners();
  }

  void decreaseAdult() {
    adult--;

    notifyListeners();
  }

  void decreaseChild() {
    child--;

    notifyListeners();
  }
}
