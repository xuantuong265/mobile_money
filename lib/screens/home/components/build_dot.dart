import 'package:flutter/material.dart';
import 'package:money_mobile/until/constants.dart';

class BuildDot extends StatelessWidget {
  const BuildDot({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),
        ),
      ],
    );
  }
}