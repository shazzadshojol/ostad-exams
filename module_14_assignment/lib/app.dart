import 'package:flutter/material.dart';
import 'package:module_14_assignment/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: Colors.blue,
              titleTextStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    );
  }
}
