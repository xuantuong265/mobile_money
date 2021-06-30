import 'package:flutter/material.dart';

class VertifyPhoneProvider extends ChangeNotifier {

  String code = "";

  set setCodeNumber(int number) {
    if(number != -1){
      if(code.length < 4){
        code = code + number.toString();
        notifyListeners();
      }
    }
    else{
      code = code.substring(0, code.length - 1);
      notifyListeners();
    }  
  }

  get getCode => this.code;

}