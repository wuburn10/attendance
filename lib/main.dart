import 'package:flutter/material.dart';
import 'package:attendance/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance Record App',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
