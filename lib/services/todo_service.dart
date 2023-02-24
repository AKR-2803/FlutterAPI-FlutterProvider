import 'dart:convert';
import 'package:apipractice/models/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  Future<List<Todo>> getAll() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List;
      final todos = jsonData
          .map((elem) => Todo(
              userId: elem['userId'],
              id: elem['id'],
              title: elem['title'],
              completed: elem['completed']))
          .toList();
      return todos;
    } else {
      throw Exception('Smtg went wrong');
    }
  }
}





// import 'dart:convert';
// import 'package:apipractice/models/todo.dart';
// import 'package:http/http.dart' as http;

// class TodoService {
//   Future<List<Todo>> getAll() async {
//     final response =
//         await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body) as List;
//       final todos = jsonData.map((e) {
//         return Todo(
//             userId: e['userId'],
//             id: e['id'],
//             title: e['title'],
//             completed: e['completed']);
//       }).toList();
//       return todos;
//     }
//     throw Exception("error");
//   }
// }
