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

class MaterialFlutterApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialFlutterAppState();
  }
}

class _MaterialFlutterAppState extends State<MaterialFlutterApp> {
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mat Design App')),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add_alarm), onPressed: () {}),
      body: Container(
          child: Center(
        child: Column(
          children: <Widget>[
            Icon(Icons.android_rounded),
            Text('android'),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      )),
    );
  }
}
