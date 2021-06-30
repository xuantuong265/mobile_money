import 'package:flutter/material.dart';
import 'package:money_mobile/until/constants.dart';

Container buildSetting(String data) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: kBackgroundButton,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              'CÀI ĐẶT',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tài khoản nhận tiền',
                style: TextStyle(
                  fontSize: 14,
                  color: kTextColor.withOpacity(0.8),
                ),
              ),
              Text(
                'TNPay',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: kTextColor
                ),
              )
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Số tiền nhận',
                style: TextStyle(
                  fontSize: 14,
                  color: kTextColor.withOpacity(0.8),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    "Không có",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kTextColor
                    ),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: kTextColor,
                  )
                ],
              )
            ],
          ),
           SizedBox(height: 25),
          Divider(
            color: kTextColor.withOpacity(0.5),
            height: 1,
          ),
          SizedBox(height: 25),
          Column(
            children: [
              Text(
                'Số tài khoản TNPay',
                style: TextStyle(
                  fontSize: 16,
                  color: kTextColor.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 15),
              Text(
                '${data}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black
                ),
              ),
              SizedBox(height: 15,)
            ],
          )
        ],
      ),
    );
  }