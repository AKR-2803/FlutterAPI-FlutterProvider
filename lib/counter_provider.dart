import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int countOfPizza = 0;

  int get givePizzaValue => countOfPizza;

  void increment() {
    countOfPizza += 1;
    notifyListeners();
  }
}
