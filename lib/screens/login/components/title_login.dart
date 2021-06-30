import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TitleLogin extends StatelessWidget {
  const TitleLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: size.height * 0.07),
        Text(
          "Đăng nhập",
          style: TextStyle(
              fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
        SizedBox(height: size.height * 0.04),
        SvgPicture.asset(
          "asset/icons/login.svg",
          height: size.height * 0.25,
        ),
      ],
    );
  }
}