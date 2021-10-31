// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:deep_d/Controller/controller.dart';
import 'package:deep_d/View/view_search.dart';
import 'package:deep_d/Model/model.dart';
import 'package:deep_d/View/view_result.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_web/image_picker_web.dart';
import 'dart:io';

// PickedFile? _image = Model().myimage;
PickedFile? _image;
String? imagepath;

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State createState() => ViewState();
}

class ViewState extends StateMVC<View> {
  ViewState() : super(Controller());

  @override
  Widget build(BuildContext context) {
    imagepath = Controller.sendpath();
    return Scaffold(
      appBar: AppBar(
        title: Text('Deep_D'),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                child: Center(
                  child: imagepath == null
                      ? Text('No image selected')
                      : Image.file(File(imagepath!)),
                  //이상하게 뜬다!!!!!!!!!!!!!!!!
                  //당연함... sendpath()를 계속 호출해서 path를 받아올 순 없음.
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            TextButton.icon(
              onPressed: () {
                print("사진 가져오기 클릭");
                setState(() {
                  Controller.getImageFromGallery();
                });
                // Controller.getImageFromGallery();
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
                Controller.sendImageToServer();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultPage()));
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
            TextButton(
              onPressed: () {
                imagepath = Controller.sendpath();
                imagepath == null
                    ? print("view.image is null")
                    : print("view.image path:" + imagepath!);
              },
              child: Text('test'),
              style: TextButton.styleFrom(
                primary: Colors.redAccent,
                onSurface: Colors.grey[200],
                minimumSize: Size(50, 50),
                elevation: 3.0,
                backgroundColor: Colors.red[50],
                shape: StadiumBorder(),
                textStyle: TextStyle(fontSize: 20.0),
              ),
            ),
          ])),
    );
  }
}
