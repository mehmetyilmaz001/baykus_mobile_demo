import 'dart:async';

import 'package:baykus_mobile_demo/models/alert.dart';
import 'package:baykus_mobile_demo/models/arrow_type.dart';
import 'package:baykus_mobile_demo/models/box_types.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SensorsProvider with ChangeNotifier{
  static const url = "http://iotreceiver.vefacaglar.com/api/ReadValue/13CE7EB1-C74D-4C2C-4E70-08D75E003FD4";
  
  double _temp = 0.0;
  double _prevTemp = 0.0;
  ArrowType _arrowType = ArrowType.equals;


  int _tempLimit = 30;
  Alert _alert = Alert(title: "", type: BoxTypes.succcess);

  double get temp{
    return _temp;
  }

  double get prevTemp{
    return _prevTemp;
  }

  Alert get alert{
    return _alert;
  }

  ArrowType get arrowType{
    return _arrowType;
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
      
      _prevTemp = _temp;
      _temp = resData["value"];

      if(_temp == _prevTemp){
        _arrowType = ArrowType.equals;

      }else if(_temp > _prevTemp){
        _arrowType = ArrowType.up;

      }else if(_temp < _prevTemp){
        _arrowType = ArrowType.down;

      }
      
      checkTemp();

       
    }catch(err){
      print(err);
    }

    notifyListeners();
  }

  void checkTemp() {
    double successLimit =  (_tempLimit * 0.9);

    if (temp < (_tempLimit * 0.9) ) {
      _alert =  Alert(title: "SICAKLIK NORMAL SEVİYEDE", type: BoxTypes.succcess);
    }
    else if (successLimit <= temp && temp <= _tempLimit ) {
      _alert =  Alert(title: "SICAKLIK KRİTİK SEVİYEYE YAKLAŞTI", type: BoxTypes.warning);
    } 
    else {
      _alert =  Alert(title: "SICAKLIK KRİTİK SEVİYEDE", type: BoxTypes.danger);
    }

    notifyListeners();
  }

}