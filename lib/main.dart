import 'package:flutter/material.dart';
import 'image_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mat Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MaterialFlutterApp(),
      home: ImageWidgetApp(),
    );
  }
}