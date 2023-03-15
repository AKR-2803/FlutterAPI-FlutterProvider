import 'package:flutter/cupertino.dart';

class CountIncreament extends ChangeNotifier {
  int valueOfPizza = 5;

  int get fetchPizzaValue => valueOfPizza;

  void increamentValue() {
    valueOfPizza++;
    notifyListeners();
  }
}
