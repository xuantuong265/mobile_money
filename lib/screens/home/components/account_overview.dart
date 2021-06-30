import 'package:flutter/material.dart';
import 'package:money_mobile/controllers/HomeProvider.dart';
import 'package:money_mobile/controllers/UserProvider.dart';
import 'package:money_mobile/until/constants.dart';
import 'package:provider/provider.dart';

class AccountOverview extends StatefulWidget {
  const AccountOverview({
    Key key,
  }) : super(key: key);

  @override
  _AccountOverviewState createState() => _AccountOverviewState();
}

class _AccountOverviewState extends State<AccountOverview> {

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).getUser;
    return Consumer<HomeProvider>(
      builder: (context, model, child) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: kBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 2,
                    offset: Offset(0,2)
                  )
                ]
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tài khoản ViettelPay:',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Visibility(
                      visible: model.getIsVisible,
                      maintainAnimation: true,
                      maintainState: true,
                      child: GestureDetector(
                        onTap: () {
                          model.setHideWidget();
                        },
                        child: Container(
                          height: 30,
                          child: Row(
                            children: [
                              Text(
                                'Xem số dư',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(width: 10),
                              // ignore: missing_required_param
                              Icon(
                                Icons.remove_red_eye,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !model.getIsVisible,
                      maintainAnimation: true,
                      maintainState: true,
                      child: GestureDetector(
                        onTap: () {
                          model.setShowWidget();
                        },
                        child: Container(
                          height: 30,
                          child: Row(
                            children: [
                              Text(
                                '${double.parse(user.price)} đ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(width: 10),
                              // ignore: missing_required_param
                              Icon(
                                Icons.remove_red_eye_outlined,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 30,
                      color: kTextWhiteColor,
                    ),
                    onPressed: () {
                       Navigator.pushNamed(context, '/enter-money');
                    },
                  ),
                )
              ],
            ),
          ),
            ],
          ),
        );
      }
    );
  }
}