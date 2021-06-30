
import 'package:flutter/material.dart';

Widget makeInput({label, obscureText = false, controller, textType, isEnable}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(label, style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      SizedBox(height: 5,),
      TextField(
        keyboardType: textType,
        controller: controller,
        obscureText: obscureText,
        enabled: isEnable,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])
          ),
        ),
      ),
      SizedBox(height: 30,),
    ],
  );
}