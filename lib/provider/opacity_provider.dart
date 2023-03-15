import 'package:flutter/cupertino.dart';

class OpacityProvider extends ChangeNotifier {
  double opacityValue = 1.0;
  double get fetchOpacityValue => opacityValue;

  void setOpacityValue(double setThisValue) {
    opacityValue = setThisValue;
    notifyListeners();
  }
}