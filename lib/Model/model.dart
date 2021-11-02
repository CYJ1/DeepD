// ignore_for_file: prefer_const_constructors

import 'package:deep_d/Controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:deep_d/Model/model.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_web/image_picker_web.dart';
import 'dart:io';

class Model extends ModelMVC {
  static void modelSendImageToServer() {
    print("send image");
  }

  static void modelSearchSendImageToServer() {
    print("검색 요청 보냄");
  }
}
