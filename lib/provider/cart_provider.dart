import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  List<String> inCartItems = [];
  List<String> get getCartitems => inCartItems;

  void addItemToCart(String itemName) {
    inCartItems.add(itemName);
    notifyListeners();
  }

  void removeItemFromCart(String itemName) {
    inCartItems.remove(itemName);
    notifyListeners();
  }
}
