// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:async';
import 'package:deep_d/main.dart';
import 'package:deep_d/Controller/controller.dart';
import 'package:deep_d/View/view_main.dart';
import 'package:flutter/material.dart';
import 'package:deep_d/View/view_search.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

//server_start
import 'package:http/http.dart' as http;

Future<String> getResult() async {
  http.Response res = await http.get('http://192.168.219.104/downloadresult'); //host ip
  return res.body;
}

/*class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}*/
/*Future<Post> fetchPost() async {
  final response =
  await http.get('http://192.168.219.104/downloadresult'); //host ip

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}*/
//server_end

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends StateMVC<ResultPage> {
  @override
  var selectedImage = Controller().selectedImage;
  bool isLoading = false;
  String result = "false";
  String resultString = "";
  //사진 판별 중엔 isLoading true, 검색 다 되면 isLoading false로 바꿔주어 화면 보이게 하기.
  //만약 판별에 10초 이상 걸릴 경우 Alert -> Snackbar로 구현할 수 있을듯?

  void printResult() {
    
    //server_start
    //Future<String> re;
    result = getResult();
    //result = re;
    //server_end
      
    if (result == "true") {
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
                  //https://blog.naver.com/chandong83/221948462147
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => View()),
                      (route) => false);
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
                                  // Image.file(File(selectedImage.path)),
                                  kisWeb
                                      ? Image.network(
                                          selectedImage!.path,
                                          height: 200,
                                        )
                                      : Image.file(
                                          File(selectedImage!.path),
                                          height: 200,
                                        ),
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
                        onPressed: result != "True"
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
