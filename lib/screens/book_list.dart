import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookList extends StatefulWidget {
  // BookList({Key? key}) : super(key: key);

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  String result = '';
  List? data;

  @override
  void initState() {
    super.initState();
    data = new List.empty(growable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getJSONData();
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Center(
            child: data!.length == 0
                ? Text('데이터가 없습니다')
                : ListView.builder(itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text(data![index]['title'].toString()),
                            Text(data![index]['authors'].toString()),
                            Text('${data![index]['sale_price'].toString()}원'),
                            Text(data![index]['status'].toString()),


                          ],
                        ),
                      ),
                    );
                  }, itemCount: data!.length,)),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = 'https://dapi.kakao.com/v3/search/book?target=title&query=doit';
    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK 5d4c5956993f33c79f958446efa93749"});
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = data = dataConvertedToJSON['documents'];
      data!.addAll(result);
    });
    return response.body;
  }
}
