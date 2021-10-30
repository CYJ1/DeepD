// ignore_for_file: prefer_const_constructors

import 'package:deep_d/View/view_main.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:deep_d/Model/model.dart';

class Controller extends ControllerMVC {
  static void getImageFromGallery() => Model().modelGetImageFromGallery();
  static void sendImageToServer() => Model.modelSendImageToServer();
  static void searchSendImageToServer() => Model.modelSearchSendImageToServer();
  static sendpath() => Model().sendImagePath();
}


//출처 https://minwook-shin.github.io/flutter-mvc/