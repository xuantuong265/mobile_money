import 'package:flutter/material.dart';
import 'package:money_mobile/until/constants.dart';

class AppBarProfile extends StatelessWidget {
  const AppBarProfile({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("asset/image/no-avatar.png"),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xfff1f3f6),
                        border: Border.all(color: Colors.grey.withOpacity(0.2))
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black12,
                        size: 10,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '0922114605',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: kTextWhiteColor,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Đồng hành',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: kTextWhiteColor,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: kTextWhiteColor,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: null,
            child: Column(
              children: [
                Icon(
                  Icons.qr_code_outlined,
                  color: kTextWhiteColor,
                ), 
                Text(
                  'Mã nhận tiền',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: kTextWhiteColor,
                    fontSize: 12
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}