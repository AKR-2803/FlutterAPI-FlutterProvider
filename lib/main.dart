import 'package:fintechdashboardclone/providers/cart_counter_provider.dart';
import 'package:fintechdashboardclone/providers/meme_cart_provider.dart';
import 'package:fintechdashboardclone/screens/home_page.dart';
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
          ChangeNotifierProvider(create: (_) => MemeCartProvider()),
          ChangeNotifierProvider(create: (_) => CartCounterProvider())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: 'SpaceMono',
                useMaterial3: true,
                colorSchemeSeed: const Color.fromARGB(255, 101, 52, 236)),
            home: HomePage()));
  }
}
