// ignore_for_file: prefer_const_constructors

import 'dart:io';
// import 'dart:html';
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
  bool isLoading = false;
  String searchResult = '';
  int similarity = 100;
  //사진 검색 중엔 isLoading true, 검색 다 되면 isLoading false로 바꿔주어 화면 보이게 하기.
  //사진 검색 후 유사도 받아오기.

  void printSearchResult() {
    searchResult = "사진의 유사도는 " + similarity.toString() + "% 입니다.";
    print(searchResult);
  }

  Widget build(BuildContext context) {
    print("검색결과창");
    printSearchResult();
    return Scaffold(
        appBar: AppBar(
            title: Text('YHHY'),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  //https://blog.naver.com/chandong83/221948462147
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                icon: const Icon(Icons.home))),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 300.0,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.file(File(selectedImage.path)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    searchResult,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
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
