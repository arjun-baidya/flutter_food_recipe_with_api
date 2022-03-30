import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_with_api/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Recipe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomaePage(),
    );
  }
}
