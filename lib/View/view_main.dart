// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:deep_d/main.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:deep_d/Controller/controller.dart';
import 'package:deep_d/View/view_search.dart';
import 'package:deep_d/Model/model.dart';
import 'package:deep_d/View/view_result.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker_web/image_picker_web.dart';
import 'dart:io';

PickedFile? _image;
String? imagepath;
var image;

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State createState() => ViewState();
}

class ViewState extends StateMVC<View> {
  ViewState() : super(Controller());

  get selectedImage => null;
  bool isweb = kisWeb;

//https://stackoverflow.com/questions/68454245/flutter-a-value-of-type-futuredynamic-cant-be-returned-from-the-method-on
  Future<bool> _onBackPress() async {
    bool goBack = false;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('종료할까요?'),
          actions: [
            TextButton(
              onPressed: () {
                goBack = false;
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                goBack = true;
                Navigator.pop(context);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
    return goBack;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPress(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Deep_D'),
          centerTitle: true,
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
                      child: Center(
                        child: _image == null
                            ? Text('No image selected')
                            : Image.file(File(_image!.path)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      print("사진 가져오기 클릭");
                      kisWeb ? print("웹에서 작동 어떻게 할까요") : getImage();
                    },
                    icon: Icon(Icons.camera_alt),
                    label: Text('사진 가져오기'),
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
                  Divider(
                    height: 60.0,
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                  TextButton(
                    onPressed: () {
                      print("사진 업로드 클릭");
                      if (_image?.path == null) {
                        print("사진을 선택해 주세요");
                        Fluttertoast.showToast(
                            msg: "사진을 먼저 선택해 주세요.",
                            toastLength: Toast.LENGTH_SHORT,
                            fontSize: 15.0);
                        //넘어갈 수 없다는 Toast Message 출력
                      } else {
                        Controller.sendImageToServer();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultPage()));
                      }
                    },
                    child: Text('사진 업로드'),
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
                ])),
      ),
    );
  }

  Future getImage() async {
    image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}
