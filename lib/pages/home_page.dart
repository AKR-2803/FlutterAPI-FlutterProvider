import 'package:apipractice/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TodoProvider>(builder: ((context, value, child) {
        final todos = value.todos;
        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return ListTile(
              leading: CircleAvatar(child: Text("${todo.id}")),
              title: Text(
                todo.title,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: todo.completed ? Colors.grey : Colors.black),
              ),
            );
          },
        );
      })),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {                                
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Provider.of<TodoProvider>(context, listen: false).getAllTodos();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("API using Provider")),
//       body: Consumer<TodoProvider>(builder: ((context, value, child) {
//         final todos = value.todos;
//         return ListView.builder(
//             itemCount: todos.length,
//             itemBuilder: (context, index) {
//               final todo = todos[index];
//               return ListTile(
//                   leading: CircleAvatar(child: Text(todo.id.toString())),
//                   title: Text(
//                     todo.title,
//                     style: TextStyle(
//                         color: todo.completed ? Colors.grey : Colors.black),
//                   ));
//             });
//       })),
//     );
//   }
// }
