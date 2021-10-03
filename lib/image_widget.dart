import 'package:flutter/material.dart';
import 'material.dart';
import 'screens/book_list.dart';
import 'screens/test_page.dart';

class ImageWidgetApp extends StatefulWidget {
  // ImageWidgetApp({Key? key}) : super(key: key);

  @override
  _ImageWidgetAppState createState() => _ImageWidgetAppState();
}

class _ImageWidgetAppState extends State<ImageWidgetApp>
    with SingleTickerProviderStateMixin {
  var thisIcon = Icon(Icons.add);

  var _tempColor = Colors.blue;

  var _tempImg = 'assets/images/img1.png';

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('hi'),
            content: Text('hello'),
          );
        });
  }

  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  TextEditingController value3 = TextEditingController();
  int sum = 0;

  List _btnList = ['더하기', '빼기', '곱하기', '나누기'];
  List<DropdownMenuItem<String>> _dropDownMenuItems =
      List.empty(growable: true);

  String? _btnText;

  TabController? controller;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    for (var item in _btnList) {
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
    }
    _btnText = _dropDownMenuItems[0].value;
    controller = TabController(length: 5, vsync: this);
    controller!.addListener(_handleSelection);
  }

  _handleSelection() {
    setState(() {
      _selectedIndex = controller!.index;
    });
    print(_selectedIndex);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  List<Widget> _widgetOptions = [
    TestPage(),
    Placeholder(color: Colors.green),
    MaterialFlutterApp(),
    Placeholder(color: Colors.red),
    BookList(),
  ];

  @override
  Widget build(BuildContext context) {
    print('hi');

    return Scaffold(
        // resizeToAvoidBottomInset : false,
        appBar: AppBar(
          title: Text('Prototype'),
          backgroundColor: Colors.amber[800],
          elevation: 0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: Container(
        //   margin: EdgeInsets.only(top: 40),
        //   width: 80,
        //   height: 80,
        //   child: FittedBox(
        //     child: FloatingActionButton(
        //       child: Icon(Icons.local_shipping, size: 33),
        //       backgroundColor: Colors.amber[800],
        //       elevation: 0,
        //       // tooltip: 'Inc',
        //       onPressed: () {
        //         print('clicked');
        //         setState(() {
        //           controller!.index = 2;
        //         });
        //         // if (mounted) {
        //         //   setState(() {
        //         //     if (_tempColor == Colors.blue) {
        //         //       _tempColor = Colors.red;
        //         //       _tempImg = 'images/img2.png';
        //         //     } else {
        //         //       _tempColor = Colors.blue;
        //         //       _tempImg = 'images/img1.png';
        //         //     }
        //         //   });
        //         // }
        //       },
        //     ),
        //   ),
        // ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.home_filled, size: 28),
              child: Text('홈', style: TextStyle(fontSize: 11, color: Colors.black)),
            ),
            Tab(
              icon: Icon(Icons.card_giftcard, size: 28),
              child: Text('상품', style: TextStyle(fontSize: 11, color: Colors.black)),
            ),
            Tab(
              child: Text(''),
            ),
            Tab(
              icon: Icon(Icons.list_alt, size: 28),
              child: Text('사용내역', style: TextStyle(fontSize: 11, color: Colors.black)),
            ),
            Tab(
              icon: Icon(Icons.person_pin, size: 28),
              child: Text('마이', style: TextStyle(fontSize: 11, color: Colors.black)),
            ),
          ],
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.amber[800],
          indicatorColor: Colors.amber[800],
          controller: controller,
        ),
        body: TabBarView(
          // children: [
          // Container(
          //   child: Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         Image.asset(_tempImg,
          //             width: 300, height: 200, fit: BoxFit.fitWidth),
          //         Padding(
          //           padding: EdgeInsets.only(
          //               top: 15, bottom: 15, left: 50, right: 50),
          //           child: Row(
          //             children: [
          //               Flexible(
          //                   child: Padding(
          //                       padding: EdgeInsets.only(left: 20, right: 20),
          //                       child: TextField(
          //                         keyboardType: TextInputType.number,
          //                         controller: value1,
          //                       ))),
          //               Flexible(
          //                   child: Padding(
          //                       padding: EdgeInsets.only(left: 20, right: 20),
          //                       child: TextField(
          //                         keyboardType: TextInputType.number,
          //                         controller: value2,
          //                       ))),
          //               Flexible(
          //                   child: Padding(
          //                       padding: EdgeInsets.only(left: 20, right: 20),
          //                       child: TextField(
          //                         keyboardType: TextInputType.number,
          //                         controller: value3,
          //                       ))),
          //             ],
          //           ),
          //         ),
          //         Padding(
          //             padding: EdgeInsets.all(15),
          //             child: ElevatedButton(
          //               child: Text('$_btnText'),
          //               onPressed: () {
          //                 // return _showDialog();
          //                 setState(() {
          //                   sum = int.parse(value2.text) +
          //                       int.parse(value1.text) +
          //                       int.parse(value3.text);
          //                 });
          //               },
          //             )),
          //         Padding(
          //           padding: EdgeInsets.all(15),
          //           child: DropdownButton(
          //             items: _dropDownMenuItems,
          //             onChanged: (String? value) {
          //               setState(() {
          //                 _btnText = value;
          //               });
          //             },
          //             value: _btnText,
          //           ),
          //         ),
          //         Padding(
          //           padding: EdgeInsets.all(15),
          //           child: Text(
          //             '덧셈값 : $sum',
          //             style: TextStyle(fontSize: 20),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // MaterialFlutterApp(),
          // Placeholder(),
          // ],
          children: _widgetOptions,
          controller: controller,
        ));
  }
}
