import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SensorsProvider with ChangeNotifier{
  static const url = "http://iotreceiver.vefacaglar.com/api/ReadValue/13CE7EB1-C74D-4C2C-4E70-08D75E003FD4";
  String _temp;

  String get temp{
    return _temp;
  }

  void setTimer() {
    Timer.periodic(new Duration(seconds: 5), (timer) {
      fetchTemp();
    });
  }

  Future<void> fetchTemp() async{
    try{
      final res = await http.get(url);
      final resData = json.decode(res.body);
      print(resData);
      _temp = resData["value"].toString();

       notifyListeners();
    }catch(err){
      print(err);
    }
  }

}