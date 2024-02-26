import 'package:flutter/material.dart';
import 'package:todo_app/screens/hello_screen/hello_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: HelloScreen(),
    ),
  );
}