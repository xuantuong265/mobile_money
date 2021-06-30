import 'package:flutter/material.dart';
import 'package:money_mobile/controllers/UserProvider.dart';
import 'package:money_mobile/until/constants.dart';
import 'package:provider/provider.dart';


class BuildInputPassword extends StatelessWidget {
  const BuildInputPassword({
    Key key,
    this.passController
  }) : super(key: key);

  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding - 5),
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.circular(kDefaultBorder),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0,2)
              )
            ]
        ),
        height: 60,
        child: TextField(
          onChanged: (value) {
            Provider.of<UserProvider>(context).setMessage('');
          },
          enabled: !Provider.of<UserProvider>(context).getLoadingLogin,
          controller: passController,
          obscureText: true,
          style: TextStyle(
              color: Colors.black87
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.visibility,
                color: Color(0xff5ac18e),
              ),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Color(0xff5ac18e),
              ),
              hintText: 'Nhập mật khẩu',
              hintStyle: TextStyle(
                  color: Colors.black38
              )
          ),
        ),
      ),
    );
  }
}