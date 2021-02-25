import 'package:flutter/material.dart';
import 'package:tiktok/login.dart';
import 'package:tiktok/requestDemo.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: RequestApiScreen()
      )
    );
  }
}



