import 'package:flutter/material.dart';
import 'package:money_mobile/controllers/UserProvider.dart';
import 'package:money_mobile/until/constants.dart';
import 'package:provider/provider.dart';
import 'action_qrcode.dart';
import 'build_qrcode.dart';
import 'build_setting.dart';

class InfoUser extends StatelessWidget {
  const InfoUser({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).getUser;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 25.0,
                        spreadRadius: 1,
                        offset: Offset(0.0, 0.75)
                    )
                  ], 
                ),
                child: Column(
                  children: [
                    SizedBox(height: 25,),
                      buildQRCode(user.phone),
                      SizedBox(height: 35),
                      buildSetting(user.number),
                  ],
                ),
              ),
              ActionQRCode(),
              SizedBox(height: 100,)
            ],
          ),
        ),
    );
  }
}


