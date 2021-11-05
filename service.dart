import 'dart:convert'; 
import 'dart:typed_data'; 
import 'package:dio/dio.dart'; 
import 'package:flutter/foundation.dart'; 

class Service { 
	Dio dio = Dio(); 
	Future<Uint8List> # (Uint8List imageData) async { 
	   try { 
	      var encodedData = await compute(base64Encode, imageData); 
                    Response response = await dio.post('http://localhost:8080/root', 
                       data: { 
                          'image': encodedData 
	         } 
	      ); 
	      String result = response.data; 
                    return compute(base64Decode, result); 
                 } catch (e) { 
                    return null; 
                 } 
             } 
          }


