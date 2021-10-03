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
  TextEditingController? _editingController;
  ScrollController? _scrollController;
  int page = 1;

  @override
  void initState() {
    super.initState();
    data = List.empty(growable: true);
    _editingController = TextEditingController();
    _scrollController = ScrollController();

    _scrollController!.addListener(() {
      if (_scrollController!.offset >=
              _scrollController!.position.maxScrollExtent &&
          !_scrollController!.position.outOfRange) {
        print('bottom');
        page++;
        getJSONData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          data!.clear();
          getJSONData();
        },
        child: const Icon(Icons.download),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
              height: 50,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: _editingController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(hintText: '검색어를 입력하세요'),
                  ))),
          data!.isEmpty
              ? const Text('')
              : Flexible(

                  // height: /MediaQuery.of(context).size.height,
                  child: ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Image.network(
                                  data![index]['thumbnail'],
                                )),
                            Expanded(
                                flex: 8,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        data![index]['title'].toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(data![index]['authors'].toString()),
                                      Text(
                                          '${data![index]['sale_price'].toString()}원'),
                                      Text(data![index]['status'].toString()),
                                    ],
                                  ),
                                ))
                          ]),
                    ));
                  },
                  itemCount: data!.length,
                  controller: _scrollController,
                ))
        ]),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        'https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=${_editingController!.text}';
    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK 5d4c5956993f33c79f958446efa93749"});
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      data!.addAll(result);
    });
    return response.body;
  }
}
