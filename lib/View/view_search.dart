// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:deep_d/Controller/controller.dart';
import 'package:deep_d/View/view_main.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends StateMVC<SearchResultPage> {
  @override
  var selectedImage = Controller().selectedImage;

  Widget build(BuildContext context) {
    print("검색결과창");
    print("selectedImage in search: " + selectedImage.path);
    return Scaffold(
        appBar: AppBar(
          title: Text('YHHY'),
          centerTitle: true,
          //홈버튼 넣기
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200.0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('검색결과창이 뜹니다 ...'),
                              ),
                              Image.file(File(selectedImage.path))
                            ])),
                  ),
                  Divider(
                    height: 60.0,
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ])));
  }
}
