import 'package:flutter/cupertino.dart';

class FavouriteProvider extends ChangeNotifier {
  List<int> selectedItems = [];
  List<int> get getListItems => selectedItems;

  void addItem(int index) {
    selectedItems.add(index);
    notifyListeners();
  }

  void removeItem(int index) {
    selectedItems.remove(index);
    notifyListeners();
  }
}







// import 'package:flutter/cupertino.dart';

// class FavouriteProvider extends ChangeNotifier {
//   List<int> _selectedItem = [];
//   List<int> get selectedItem => _selectedItem;


//   void addItem(int addThisValue) {
//     _selectedItem.add(addThisValue);
//     notifyListeners();
//   }
//   void removeItem(int removeThisValue) {
//     _selectedItem.remove(removeThisValue);
//     notifyListeners();
//   }
// }
