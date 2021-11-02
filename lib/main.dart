// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:deep_d/View/view_main.dart';

bool kisWeb = false;
void main() {
  runApp(MyApp());
  //https://themach.tistory.com/197

  try {
    if (Platform.isAndroid || Platform.isIOS) {
      kisWeb = false;
    } else {
      kisWeb = true;
    }
  } catch (e) {
    kisWeb = true;
  }
}

class MyApp extends AppMVC {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("kisWeb: " + kisWeb.toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      title: 'DeepD',
      home: View(),
    );
  }
}
