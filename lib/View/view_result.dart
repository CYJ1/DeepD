// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:deep_d/Controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:deep_d/View/view_search.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends StateMVC<ResultPage> {
  @override
  var selectedImage = Controller().selectedImage;
  Widget build(BuildContext context) {
    print("결과창입니다");
    print("selectedImage in result: " + selectedImage.path);
    return Scaffold(
        appBar: AppBar(
          title: Text('YHHY'),
          centerTitle: true,
          //홈버튼 넣기
          //홈버튼 클릭 시 이전꺼 다 사라지게 (뒤로가기 했을때 이전검색 안나오게)
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
                  TextButton(
                    onPressed: () {
                      print("사진 검색 클릭");
                      Controller.searchSendImageToServer();
                      //사진 검색으로 넘기기
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchResultPage()));
                    },
                    child: Text('사진 검색'),
                    style: TextButton.styleFrom(
                      primary: Colors.redAccent,
                      onSurface: Colors.grey[200],
                      minimumSize: Size(200, 80),
                      elevation: 3.0,
                      backgroundColor: Colors.red[50],
                      shape: StadiumBorder(),
                      textStyle: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ])));
  }
}
