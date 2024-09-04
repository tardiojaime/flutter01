import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/screen/counter_function_screen.dart';
//import 'package:hello_world_app/presentation/screen/counter_screen.dart';

void main() {
  // un widget inicial
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorSchemeSeed: Colors.blue),
        home: const CounterFunctionScreen());
  }
}
