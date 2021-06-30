import 'package:flutter/material.dart';
import 'package:money_mobile/until/constants.dart';

class ActionQRCode extends StatelessWidget {
  const ActionQRCode({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: kTextColor.withOpacity(0.1)) 
                ),
                child: Icon(
                  Icons.arrow_circle_down,
                  color: kTextColor,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Lưu hình',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black.withOpacity(0.8)
              ),
            )
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: kTextColor.withOpacity(0.1)) 
                ),
                child: Icon(
                  Icons.share_outlined,
                  color: kTextColor,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Chia sẻ',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black.withOpacity(0.8)
              ),
            )
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: kTextColor.withOpacity(0.1)) 
                ),
                child: Icon(
                  Icons.history_edu_outlined,
                  color: kTextColor,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Lịch sử',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black.withOpacity(0.8)
              ),
            )
          ],
        ),
      ],
    );
  }
}