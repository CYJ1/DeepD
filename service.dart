import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum DataKind { NONE, STRING, IMAGE, ARRAY }

Future<String> fetchString(DataKind kind) async {
    if(kind == DataKind.NONE)
        return '';

    print(kind.toString());
    print(kind.toString().split('.')[1]);
    final details = ['', 'upload', 'module', 'download'];
    final urlPath = 'http://172.30.1.25/' + details[kind.index]; //host ip
    
    final response = await http.get(urlPath);
    
    if (response.statusCode == 200)
        return response.body;
}
