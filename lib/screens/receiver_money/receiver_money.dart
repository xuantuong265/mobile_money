import 'package:flutter/material.dart';
import 'package:money_mobile/until/constants.dart';

import 'components/app_bar.dart';
import 'components/bottom.dart';
import 'components/info_user.dart';

class ReceiverMoney extends StatefulWidget {
  @override
  _ReceiverMoneyState createState() => _ReceiverMoneyState();
}

class _ReceiverMoneyState extends State<ReceiverMoney> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: kBackgroundColor,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              InfoUser(),
              Bottom(),
            ],
          ),
        )
      ),
    );
  }
}


  