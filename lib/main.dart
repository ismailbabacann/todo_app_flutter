import 'package:flutter/material.dart';
import 'package:todo_uygulamasi/screens/AddNewTask.dart';
import 'package:todo_uygulamasi/screens/home.dart';
import 'package:todo_uygulamasi/todoitem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: HomeScreen(),
    );
}}