//Provider Examples
// import 'package:apipractice/dark_theme_screen.dart';
// import 'package:apipractice/login_screen.dart';
// import 'package:apipractice/providerexamples/favourite_example.dart';
// import 'package:apipractice/providerexamples/notify_listeners_screen.dart';
// import 'package:apipractice/providerexamples/opacity_example.dart';
import 'package:apipractice/provider/auth_provider.dart';
import 'package:apipractice/provider/cart_provider.dart';
import 'package:apipractice/provider/favourite_provider.dart';
import 'package:apipractice/provider/opacity_provider.dart';
import 'package:apipractice/provider/theme_changer_provider.dart';
import 'package:apipractice/providerexamples/cart_example.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OpacityProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavouriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeChangerProvider(),
        ),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        //you can add multiple providers here
      ],
      // child: MaterialApp(home: OpacityExample()),
      // child: MaterialApp(home: FavouriteExample()),
      // child: Builder(
      //   builder: (BuildContext context) {
      //     final themeChanger = Provider.of<ThemeChangerProvider>(context);
      //     return MaterialApp(
      //         title: 'Demo Provider Theme',
      //         themeMode: themeChanger.getThemeMode,
      //         theme: ThemeData(
      //             primarySwatch: Colors.lightGreen,
      //             brightness: Brightness.light,
      //             iconTheme: IconThemeData(color: Colors.lightGreen)),
      //         darkTheme: ThemeData(
      //             brightness: Brightness.dark,
      //             primarySwatch: Colors.red,
      //             iconTheme: IconThemeData(color: Colors.red)),
      //         highContrastDarkTheme: ThemeData(
      //             brightness: Brightness.dark,
      //             primarySwatch: Colors.yellow,
      //             iconTheme: IconThemeData(color: Colors.yellow)),
      //         home: DarkThemeScreen());
      //   },
      // ),

      //Login Screen Authentication POST API
      //child: MaterialApp(home: LoginScreen()),

      //Provider Cart Example
      child: MaterialApp(home: CartExample()),
    );
  }
}


//Provider Example : Counter
/*
import 'package:apipractice/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MaterialApp(home: CounterExample()),
    );
  }
}

class CounterExample extends StatefulWidget {
  const CounterExample({Key? key}) : super(key: key);

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  @override
  Widget build(BuildContext context) {
    //ignore: avoid_print
    print(
        ".......................Build Method called, whole UI rebuilding......");
    final countProvider = Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("Provider Counter Example")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "You have pressed the button these many times :",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Consumer<CounterProvider>(builder: ((context, value, child) {
            return Text(
              countProvider.givePizzaValue.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            );
          })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/

//ThemeChange with Provider
/*
import 'package:apipractice/dark_theme_screen.dart';
import 'package:apipractice/provider/theme_changer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ],
        child: Builder(
          builder: (BuildContext context) {
            final themeChanger = Provider.of<ThemeChangerProvider>(context);
            return MaterialApp(
                themeMode: themeChanger.getThemeMode,
                theme: ThemeData(
                  primarySwatch: Colors.green,
                  brightness: Brightness.light,
                ),
                darkTheme: ThemeData(
                  primarySwatch: Colors.red,
                  brightness: Brightness.dark,
                ),
                home: DarkThemeScreen());

//              theme: ThemeData(
//                   primarySwatch: Colors.lightGreen,
//                   brightness: Brightness.light,
//                   iconTheme: IconThemeData(color: Colors.lightGreen)),
//               darkTheme: ThemeData(
//                   brightness: Brightness.dark,
//                   primarySwatch: Colors.red,
//                   iconTheme: IconThemeData(color: Colors.red)),
          },
        ));
  }
}
*/

