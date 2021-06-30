import 'package:flutter/material.dart';
import 'package:money_mobile/until/constants.dart';

class ItemAction extends StatelessWidget {
  const ItemAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      margin: EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 10.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: kBackgroundButton,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: <Widget>[
            Icon(
              Icons.access_alarm,
              size: 25.0,
            ),
            SizedBox(width: 15.0),
            Text(
              "Tài khoản TNPay"
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 20.0,
            )
          ],
        ),
      ),
    );
  }
}