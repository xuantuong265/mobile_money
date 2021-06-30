import 'package:flutter/material.dart';

AppBar buildAppBar() {
    return AppBar(
       leading: GestureDetector(
         onTap: () {},
         child: Icon(
          Icons.arrow_back,
          size: 30,
          color: Colors.black,
        ),
       ),
       title: Text(
        "Verify phone",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
     );
}