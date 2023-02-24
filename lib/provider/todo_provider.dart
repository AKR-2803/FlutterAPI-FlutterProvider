import 'package:apipractice/models/todo.dart';
import 'package:apipractice/services/todo_service.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final TodoService _service = TodoService();
  bool isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();

    _todos = await _service.getAll();
    isLoading = false;
    notifyListeners();
  }
}



// import 'package:apipractice/models/todo.dart';
// import 'package:apipractice/services/todo_service.dart';
// import 'package:flutter/cupertino.dart';

// class TodoProvider extends ChangeNotifier {
//   final TodoService _service = TodoService();
//   bool isLoading = false;
//   List<Todo> _todos = [];
//   List<Todo> get todos => _todos;

//   Future<void> getAllTodos() async {
//     isLoading = true;
//     notifyListeners();

//     final response = await _service.getAll();
    
//     _todos = response;
//     isLoading = false;
//     notifyListeners();
//   }
// }
