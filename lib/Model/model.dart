// ignore_for_file: prefer_const_constructors

import 'package:deep_d/Controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:deep_d/Model/model.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_web/image_picker_web.dart';
import 'dart:io';

// final ImagePicker _picker = ImagePicker();
PickedFile? myimage;

class Model extends ModelMVC {
  Future modelGetImageFromGallery() async {
    print("사진가져옵니다");
    PickedFile image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    myimage = image;
    print("myimage path: " + myimage!.path);
  }

  String? sendImagePath() {
    print("model: myimage path send");
    return myimage?.path;
  }

  static void modelSendImageToServer() {
    print("send image");
  }

  static void modelSearchSendImageToServer() {
    print("검색 요청 보냄");
  }
}
