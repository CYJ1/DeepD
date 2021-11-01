// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:deep_d/Controller/controller.dart';
import 'package:deep_d/View/view_main.dart';
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
  bool isLoading = false;
  bool result = false;
  String resultString = "";
  //사진 판별 중엔 isLoading true, 검색 다 되면 isLoading false로 바꿔주어 화면 보이게 하기.

  void printResult() {
    if (result) {
      resultString = "진짜 사진입니다.";
    } else {
      resultString = "가짜 사진입니다.";
    }
  }
  //result (true, false) 받아와서 출력할 준비~

  Widget build(BuildContext context) {
    print("결과창입니다");
    printResult();
    // print("selectedImage in result: " + selectedImage.path);
    return Scaffold(
        appBar: AppBar(
            title: Text('YHHY'),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => View()));
                },
                icon: const Icon(Icons.home))
            //홈버튼 클릭 시 이전꺼 다 사라지게 (이전페이지가 나오는게 아니라 홈이 나오도록)
            ),
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
                                    resultString,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ])),
                      ),
                      Divider(
                        height: 60.0,
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                      TextButton(
                        onPressed: !result
                            ? () {
                                print("사진 검색 클릭");
                                Controller.searchSendImageToServer();
                                //사진 검색으로 넘기기
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchResultPage()));
                              }
                            : null,
                        //진짜 사진이면 사진 검색 비활성화.. 더 예쁘게 할 수 없을까..?
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
