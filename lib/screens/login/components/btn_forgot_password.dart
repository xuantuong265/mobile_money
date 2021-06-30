import 'package:flutter/material.dart';
import 'package:money_mobile/until/constants.dart';

class BuildForgotPassword extends StatelessWidget {
  const BuildForgotPassword({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {},
        child: Text(
          'Quên mật khẩu?',
          style: TextStyle(
            color: kTextWhiteColor,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
