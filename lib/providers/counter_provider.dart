import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int total = 0;

  void increment() {
    total++;
    notifyListeners();
  }

  void decrement() {
    total--;
    notifyListeners();
  }
}
