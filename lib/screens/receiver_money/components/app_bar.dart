import 'package:flutter/material.dart';
import 'package:money_mobile/until/constants.dart';

AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: kTextWhiteColor,
        ),
        onPressed: () {
          Navigator.pop(context, '/enter-money');
        },
      ),
      title: Text(
        'Nhận tiền',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: kBackgroundColor,
          fontSize: 17
        ),
      ),
      actions: [
        Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            color: kBackgroundColor,
          ),
          child: IconButton(
            icon: Icon(
              Icons.local_activity,
              color: Colors.black12,
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }