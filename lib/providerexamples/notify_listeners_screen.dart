//Stateless behaves as Stateful Widget!
//Using ValueNotifier and ValueListenableBuilder!
/*
import 'package:flutter/material.dart';

class NotifyListenersScreen extends StatelessWidget {
  NotifyListenersScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    print(".....................Build Method.");
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider--Example"),
        centerTitle: true,
      ),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: _counter,
            builder: ((context, value, child) {
              return Text(
                _counter.value.toString(),
                style: TextStyle(fontSize: 50),
              );
            })),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _counter.value++;
            print(_counter.value.toString());
          },
          child: Icon(Icons.add)),
    );
  }
}
*/

// Password hide visibility
/*
import 'package:flutter/material.dart';

class NotifyListenersScreen extends StatelessWidget {
  final ValueNotifier<bool> togglePasswordVisibility = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stateless -> Stateful")),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ValueListenableBuilder(
            valueListenable: togglePasswordVisibility,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: togglePasswordVisibility.value,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  suffix: InkWell(
                    onTap: () {
                      togglePasswordVisibility.value =
                          !togglePasswordVisibility.value;
                    },
                    child: Icon(togglePasswordVisibility.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
              );
            })
      ]),
    );
  }
}
*/


