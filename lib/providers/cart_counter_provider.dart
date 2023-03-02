import 'package:flutter/cupertino.dart';

class CartCounterProvider extends ChangeNotifier {
  int cartCount;
  CartCounterProvider({this.cartCount = 0});

  int get getCartCount => cartCount;

  void increment() {
    cartCount += 1;
    notifyListeners();
  }

  void decrement() {
    cartCount -= 1;
    notifyListeners();
  }
}
