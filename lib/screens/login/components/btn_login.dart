import 'package:flutter/material.dart';
import 'package:money_mobile/controllers/UserProvider.dart';
import 'package:money_mobile/until/constants.dart';
import 'package:provider/provider.dart';

class BuildButtonLogin extends StatelessWidget {
  const BuildButtonLogin({
    Key key,
    this.press
  }) : super(key: key);

  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding - 5),
          child: MaterialButton(
            onPressed: press,
            elevation: 0,
            minWidth: double.infinity,
            padding: EdgeInsets.all(kDefaultPadding - 15),
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultBorder)
            ),
            child: Text(
              'Đăng nhập',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kTextWhiteColor,
                fontSize: kDedaultFontSize
              )
            ),
          ),
        );
  }
}