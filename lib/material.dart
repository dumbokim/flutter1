import 'package:flutter/material.dart';

class MaterialFlutterApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialFlutterAppState();
  }
}

class _MaterialFlutterAppState extends State<MaterialFlutterApp> {
  List _tempList = [
    'hi',
    'bye',
    'its me',
    'hi',
    'bye',
    'its me',
    'hi',
    'bye',
    'its me',
    'hi',
    'bye',
    'its me',
    'hi',
    'bye',
    'its me',
    'hi',
    'bye',
    'its me',
    'hi',
    'bye',
    'its me',
    'hi',
    'bye',
    'its me',
    'hi',
    'bye',
    'its me',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Mat Design App')),
      body: Container(
        child: Center(
          child: ListView.builder(
            // scrollDirection: Axis.horizontal,
            itemBuilder: (context, position) {
              return GestureDetector(
                child: Container(
                    height: 100,
                    child: Card(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '${_tempList[position]}',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ))
                        ],
                      ),
                    )),
                onTap: () {
                  AlertDialog dialog = AlertDialog(
                    content: Text(
                      '이 문장은 ${_tempList[position]} 입니다.',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('확인'))
                    ],
                  );

                  showDialog(
                      context: context,
                      builder: (BuildContext context) => dialog);
                },
              );
            },
            itemCount: _tempList.length,
          ),
        )
      ),
    );
  }
}
