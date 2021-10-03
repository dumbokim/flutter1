import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  // TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [Positioned(bottom: 0, left: 0, child: Container(
          width: size.width,
          height: 80,
          color: Colors.white,
          child: Stack(
            children: [
              Center(
                heightFactor: 0.6,
                child: FlatButton(
                  padding: EdgeInsets.all(30),
                  shape: CircleBorder(),
                  color: Colors.green,
                  onPressed: () {}, 
                  child: Icon(Icons.add)),
              ),
              Container(
                width: size.width,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    Container(width: size.width*0.2),
                    IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.add)),

                    
                  ],
                ),
              )
              

            ],
          ),
        ))],
      ),
    );
  }
}
