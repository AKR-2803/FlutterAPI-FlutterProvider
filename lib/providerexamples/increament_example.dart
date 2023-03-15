//Paste this in main.dart
/*  
import 'package:apipractice/provider/counter_provider.dart';
import 'package:apipractice/providerexamples/increament_example.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountIncreament(),
      child: MaterialApp(home: IncreamentExample()),
    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:apipractice/provider/counter_provider.dart';

class IncreamentExample extends StatefulWidget {
  const IncreamentExample({Key? key}) : super(key: key);

  @override
  State<IncreamentExample> createState() => _IncreamentExampleState();
}

class _IncreamentExampleState extends State<IncreamentExample> {
  @override
  void initState() {
    super.initState();
    final providerOfCount =
        Provider.of<CountIncreament>(context, listen: false);
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      providerOfCount.increamentValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("..................................I am building");
    final countProvider = Provider.of<CountIncreament>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<CountIncreament>(builder: ((context, value, child) {
                return Text(
                  value.fetchPizzaValue.toString(),
                  style: const TextStyle(fontSize: 30),
                );
              })),
              ElevatedButton(
                  onPressed: () {
                    countProvider.increamentValue();
                  },
                  child: const Text("Increase"))
            ]),
      ),
    );
  }
}
